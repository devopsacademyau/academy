include .env

RUNNER ?= docker-compose run --rm -T

init: pull-required-images
	@$(RUNNER) terraform init
.PHONY:init

apply:
	@$(RUNNER) \
		-e TF_VAR_mail_sender=$(TF_VAR_mail_sender) \
		-e TF_VAR_photos_bucket=$(TF_VAR_photos_bucket) \
		terraform apply $(TF_FLAGS)
.PHONY: apply

deploy: init
	@$(MAKE) apply TF_FLAGS=-auto-approve
.PHONY: deploy

clean:
	@$(MAKE) clean-s3
	@$(MAKE) sns-report-topic-unsubscribe
	@$(RUNNER) terraform destroy -auto-approve
	@$(RUNNER) toolbox sh -c 'rm -rf ./terraform/files'
.PHONY: clean

kick-test-n-run:
	@$(eval BUCKET_NAME=$(shell $(RUNNER) jq -r ".outputs[\"photos_bucket\"].value" ./terraform/terraform.tfstate))

	@echo "\e[32mCreating new customer...\e[0m \n"
	@$(MAKE) create-customer FIRST_NAME="Linus" LAST_NAME="Torvalds" EMAIL="$(CUSTOMER_TEST_EMAIL)"  
	
	@echo "\n \e[32mListing table content\e[0m \n"
	@$(MAKE) list-customers

	@echo "\n Uploading a picture 🖼\n"
	@touch $(CUSTOMER_TEST_EMAIL).jpg
	@aws s3 cp $(CUSTOMER_TEST_EMAIL).jpg s3://$(BUCKET_NAME)/$(CUSTOMER_TEST_EMAIL).jpg
	@rm $(CUSTOMER_TEST_EMAIL).jpg
.PHONY: kick-test-n-run

create-customer: pull-required-images
	@$(eval API_KEY=$(shell $(RUNNER) jq -r ".outputs[\"api_key\"].value" ./terraform/terraform.tfstate))
	@$(eval API_URL=$(shell $(RUNNER) jq -r ".outputs[\"api_url\"].value" ./terraform/terraform.tfstate))

	@$(eval CURL_REQUEST="curl -v -POST \
		-H \"X-API-Key: $(API_KEY)\" \
		-H \"Content-type: application/json\" \
		--url \"$(API_URL)/customers\" \
		-d \'{ \"firstname\": \"$(FIRST_NAME)\", \"lastname\": \"$(LAST_NAME)\", \"email\": \"$(EMAIL)\" }\'")

	@echo "Running cURL command: $(CURL_REQUEST)"

	@$(shell echo "$(CURL_REQUEST)")
.PHONY:create-customer

list-customers: pull-required-images
	@$(RUNNER) aws dynamodb scan \
		--table-name DA_Serverless \
		--output json \
		| $(RUNNER) jq '[.Items[] | {id: .id.S, firstname: .firstname.S, lastname: .lastname.S, email: .email.S, created_at: .created_time.S, photo_location: .photo_location.S}]' 
.PHONY:list-customers

kick-n-run: 
	@$(MAKE) deploy
	@echo "\e[33mCreating subscription for Customers Count Report Topic.\e[0m"
	@$(MAKE) sns-report-topic-subscribe

	@echo "\e[33mWaiting the provision of all services\e[0m"
	@$(RUNNER) aws dynamodb wait table-exists --table-name DA_Serverless
	
	@echo "\e[33mWaiting for lambda\e[0m"
	@$(RUNNER) aws lambda wait function-active --function-name func_customers
	
	@echo "Go to your e-mail to confirm the topic subscription and run \e[33mmake kick-test-n-run\e[0m"
.PHONY:kick-n-run

sns-report-topic-subscribe: pull-required-images
	$(eval SNS_REPORT_TOPIC_ARN=$(shell $(RUNNER) jq -r ".outputs[\"report_topic_arn\"].value" ./terraform/terraform.tfstate))
	@$(RUNNER) --entrypoint=sh \
		-e SNS_REPORT_TOPIC_ARN=$(SNS_REPORT_TOPIC_ARN) \
		-e SNS_REPORT_EMAIL=$(SNS_REPORT_EMAIL) \
		aws ./scripts/sns-report-topic-subscriber.sh
.PHONY:sns-report-topic-subscribe

sns-report-topic-unsubscribe: pull-required-images
	$(eval SNS_REPORT_TOPIC_ARN=$(shell $(RUNNER) jq -r ".outputs[\"report_topic_arn\"].value" ./terraform/terraform.tfstate))
	@$(RUNNER) --entrypoint=sh \
		-e SNS_REPORT_TOPIC_ARN=$(SNS_REPORT_TOPIC_ARN) \
		-e SNS_REPORT_EMAIL=$(SNS_REPORT_EMAIL) \
		aws ./scripts/sns-report-topic-unsubscriber.sh
.PHONY:sns-report-topic-unsubscribe

clean-s3: pull-required-images
	@$(eval BUCKET_NAME=$(shell $(RUNNER) jq -r ".outputs[\"photos_bucket\"].value" ./terraform/terraform.tfstate))
	@$(RUNNER) --entrypoint=sh \
		-e BUCKET_NAME=$(BUCKET_NAME) \
		aws ./scripts/clean-s3.sh
.PHONY:clean-s3

pull-required-images:
	@if [ -z "$(shell docker image ls --filter=reference=stedolan/jq -q)" ]; then\
		docker-compose pull jq;\
	fi

	@if [ -z "$(shell docker image ls --filter=reference=hashicorp/terraform -q)" ]; then\
		docker-compose pull terraform;\
	fi

	@if [ -z "$(shell docker image ls --filter=reference=flemay/musketeers -q)" ]; then\
		docker-compose pull toolbox;\
	fi

	@if [ -z "$(shell docker image ls --filter=reference=amazon/aws-cli -q)" ]; then\
		docker-compose pull aws;\
	fi
.PHONY:pull-required-images