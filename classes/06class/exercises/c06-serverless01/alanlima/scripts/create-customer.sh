API_KEY=$(jq -r ".outputs[\"api_key\"].value" ./terraform/terraform.tfstate)
API_URL=$(jq -r ".outputs[\"api_url\"].value" ./terraform/terraform.tfstate)

CUSTOMER_JSON="{ \"firstname\": \"$FIRST_NAME\", \"lastname\": \"$LAST_NAME\", \"email\": \"$EMAIL\" }"

echo "Running cURL command: $CUSTOMER_JSON"

curl -v -s -POST \
    -H "X-API-Key: $API_KEY" \
    -H "Content-type: application/json" \
    --url "$API_URL/customers" \
    -d "$CUSTOMER_JSON"
