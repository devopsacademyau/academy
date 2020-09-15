aws dynamodb scan \
    --table-name DA_Serverless \
    --output json \
    | jq '[.Items[] | {id: .id.S, firstname: .firstname.S, lastname: .lastname.S, email: .email.S, created_at: .created_time.S}]'