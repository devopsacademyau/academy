DOCKER ?= docker-compose run --rm

clean:
	@echo "🧹🧹🧹 Cleaning"
	$(DOCKER) terraform destroy

deploy: 
	@echo "🔨🧟🛠️Deploying"
	$(DOCKER) terraform apply

init:
	@echo "🏁🚥 Initializing...."
	$(DOCKER) init