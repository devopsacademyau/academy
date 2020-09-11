include .env

RUNNER ?= docker-compose run --rm -T

init: pull-required-images
	@$(RUNNER) terraform init
.PHONY:init

apply: pull-required-images
	@$(RUNNER) terraform apply $(TF_FLAGS)
.PHONY:apply

deploy: init
	@$(MAKE) apply TF_FLAGS=-auto-approve
.PHONY: deploy

kick-n-run: deploy sns-topic-subscribe
.PHONY: kick-n-run

clean: sns-topic-unsubscribe terminate-instances
	@$(RUNNER) terraform destroy -auto-approve
	@$(RUNNER) toolbox sh -c 'rm -rf ./terraform/files'
.PHONY:clean

run-instance-without-tag:
	@$(RUNNER) aws ec2 run-instances \
		--image-id ami-04025138b31328de6 \
		--instance-type t2.micro \
		--tag-specifications 'ResourceType=instance,Tags=[{Key=untagged-tracker,Value=true}]' \
		--no-cli-pager
.PHONY:run-instance-without-tag

run-instance-with-tag:
	@$(RUNNER) aws ec2 run-instances \
		--image-id ami-04025138b31328de6 \
		--instance-type t2.micro \
		--tag-specifications 'ResourceType=instance,Tags=[{Key=untagged-tracker,Value=true},{Key=CostCentre,Value=dev}]' \
		--no-cli-pager
.PHONY:run-instance-with-tag

list-instances:
	@$(RUNNER) aws ec2 describe-instances \
		--query 'Reservations[*].Instances | [].{Instance:InstanceId,State:State.Name,Tags:Tags}' \
		--filters "Name=tag-key,Values=untagged-tracker" \
		--output yaml \
		--no-cli-pager 
.PHONY:list-instances

terminate-instances:
	@$(RUNNER) --entrypoint=sh \
		aws ./scripts/terminate-instances.sh
.PHONY:terminate-Instances

sns-topic-subscribe: pull-required-images
	$(eval SNS_TOPIC_ARN=$(shell $(RUNNER) jq -r ".outputs[\"untagged_instance_removed_topic_arn\"].value" ./terraform/terraform.tfstate))
	@$(RUNNER) --entrypoint=sh \
		-e SNS_TOPIC_ARN=$(SNS_TOPIC_ARN) \
		-e SNS_TARGET_EMAIL=$(SNS_TARGET_EMAIL) \
		aws ./scripts/sns-subscriber.sh
.PHONY:sns-topic-subscribe

sns-topic-unsubscribe: pull-required-images
	$(eval SNS_TOPIC_ARN=$(shell $(RUNNER) jq -r ".outputs[\"untagged_instance_removed_topic_arn\"].value" ./terraform/terraform.tfstate))
	@$(RUNNER) --entrypoint=sh \
		-e SNS_TOPIC_ARN=$(SNS_TOPIC_ARN) \
		-e SNS_TARGET_EMAIL=$(SNS_TARGET_EMAIL) \
		aws ./scripts/sns-unsubscriber.sh
.PHONY:sns-topic-unsubscribe

pull-required-images:
	@if [ -z "$(shell docker image ls --filter=reference=stedolan/jq -q)" ]; then\
		docker-compose pull jq;\
	fi

	@if [ -z "$(shell docker image ls --filter=reference=hashicorp/terraform -q)" ]; then\
		docker-compose pull terraform;\
	fi

	@if [ -z "$(shell docker image ls --filter=reference=amazon/aws-cli -q)" ]; then\
		docker-compose pull aws;\
	fi

	@if [ -z "$(shell docker image ls --filter=reference=flemay/musketeers -q)" ]; then\
		docker-compose pull toolbox;\
	fi
.PHONY:pull-required-images