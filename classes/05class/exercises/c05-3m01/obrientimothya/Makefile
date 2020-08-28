DOCKER=docker-compose run --rm

build:
	docker build -t obrientimothya/aws-cli:2.0.0 .
.PHONY: build

create_bucket:
	$(DOCKER) aws bash scripts/create_bucket.sh
.PHONY: build

delete_bucket:
	$(DOCKER) aws bash scripts/delete_bucket.sh
.PHONY: delete_bucket
