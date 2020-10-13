DB_NAME=$1
AWS_DEFAULT_REGION=$2
aws ssm put-parameter --name "DB_NAME" --type "SecureString" --value $DB_NAME --overwrite --region $AWS_DEFAULT_REGION
