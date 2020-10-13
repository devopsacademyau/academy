make _put-db-name-parameter
make _deploy
echo "Waiting the provision of all services"
aws dynamodb wait table-exists --table-name DA_Serverless
echo "Waiting for lambda"
aws lambda wait function-active --function-name func_customers
echo "Sleep time"
sleep 20s