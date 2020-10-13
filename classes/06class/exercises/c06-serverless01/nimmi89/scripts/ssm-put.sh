aws ssm put-parameter \
		--name DB_NAME \
		--value ${DB_NAME} \
		--type SecureString \
		--overwrite \
		--region ap-southeast-2