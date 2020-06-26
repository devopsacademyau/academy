# Creating a POST API using API Gateway, Lambda and DynamoDB

For this exercise you will create a POST API for creating a record in the database using APIs. This is a common scenario that we see in several software projects.

For that you will use:
- AWS API Gateway, Lambda, DynamoDB, KMS, SSM
- Terraform for IaC
- 3 Musketeers 

**IMPORTANT**: copy the files [src/](./src) folder to your exercise folder under your user name. You will use them as a base to develop the solution.

Requirements:

1. **Terraform**:
   1. Build all resources below using terraform
   2. Make sure to export as output the URL for the API endpoint
2. **API Gateway**:
   1. You need to create a public REST API that will expose the following endpoints:
      1. `POST /customers`: For creating a new customer in the database.
   2. API Gateway: All resources will have Proxy integration with Lambda
   3. Authentication: Use API Key to protect your API. Push the value of the API key to SSM parameter store after creation.
3. **Lambda**: 
   1. Source code is provided for you in Python (it is in the `src/lambda.zip`). Check it in [src/ folder](./src). You will point to this zip file in your terraform Lambda resource.
   2. This lambda will have an environment variable called `DB_NAME`. Make sure the value for this variable is fetched from SSM Parameter Store for deployment.
   3. *Tip: Lambda permissions: Lambda will need `dynamodb:PutItem` access*. Lambda will also need to grant invokeFunction permission to the API Gateway.
4. **SSM Parameter store**: Use parameter store to store and retrieve the value of `DB_NAME` in your 3 Musketeers scripts.
5. **KMS Key**: Create a new key used for encrypting the DynamoDB table. 
   1. *Tip: lambda will require access to Encrypt the data using this key. This needs to be described in the KMS Key policy.*
6. **DynamoDB**: 
   1. Table name must be `DA_Serverless`
   2. Create a table like the following:
      1. id (Partition Key): String
      2. firstname: String
      3. lastname: String
      4. email: String
   3. Use the CMK Key created before to encrypt the DynamoDB table at rest. `Encryption Type` should show `KMS` in the console for the Table.
7. **3 Musketeers**:
   1. Make targets:
      1. `deploy`: It will deploy the solution using Terraform, creating all resources listed above
      2. `clean`: It will destroy all resources created.

You can test your endpoint using:
```
curl -X POST <YOUR_API_FULL_ENDPOINT_HERE> -d "{ \"firstname\": \"Your Name here\"}"
```

You should see a new item inserted in the DynamoDB Table.

## Submit a PR with the following files:
- README.md based on the [ANSWER.md file](ANSWER.md) with a link to the following files from your answer (the actual solution may have more files):
    - `main.tf`: terraform code for all resources
    - `output.tf`: terraform outputs
    - `Makefile`: 3 Musketeers implementation
    - In the `README.md` file include details on the execution of the test below:
      ```
      curl -v -X POST <YOUR_API_FULL_ENDPOINT_HERE> -d "{ \"firstname\": \"Your Name here\", \"lastname\": \"Your Name here\", \"email\": \"Your Name here\"}"
      ```
