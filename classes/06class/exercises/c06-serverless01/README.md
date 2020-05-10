# Creating an CRUD API

For this exercise you will create an API for CRUD operation (Create, Read, Update and Delete). This is a common scenario that we see in several software projects.

For that you will use:
- AWS API Gateway, Lambda, DynamoDB, KMS, SSM
- Terraform for IaC
- 3 Musketeers 

Requirements:
1. **API Gateway**: 
   1. You need to create a public REST API that will expose the following endpoints:
      1. `POST /users`: For creating a new user
   2. API Gateway: All resources will have Proxy integration with Lambda
   3. Authentication: Use API Key to protect your API. Push the value of the API key to SSM parameter store after creation.
2. **Lambda**: 
   1. Source code is provided for you in Python. Check it in [src/ folder](./src)
   2. Lambda: Lambda will need `dynamodb:PutItem` access
3. **KMS Key**: Create a new key used for encrypting the DynamoDB table. 
   1. *Tip: lambda will need to have access to Encrypt using this key. This needs to be described in the KMS Key policy.*
4. **DynamoDB**: 
   1. Table name must be `DA_Serverless`
   2. Create a table like the following:
      1. id (Partition Key): String
      2. firstname: String
      3. lastname: String
      4. email: String
   3. Use the CMK Key created before to encrypt the DynamoDB table at rest.
5. **SSM Parameter store**: Use parameter store to store and retrieve the value of `DB_NAME` in your 3 Musketeers scripts.
6. **3 Musketeers**:
   1. Make targets:
      1. `deploy`: It will deploy the solution in Terraform, creating all resources listed above
  
