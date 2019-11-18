BUCKET_NAME?=devopsacademy.com.au

config:
	aws configure --profile website

prepare:
	export AWS_PROFILE=website

deploy_website:
	aws s3 sync . s3://${BUCKET_NAME}
