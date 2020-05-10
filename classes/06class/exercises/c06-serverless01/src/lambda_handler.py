import os
import uuid
import boto3
from logging import error

def create_customer(firstname, lastname, email):
    dynamo_db = boto3.client('dynamodb')
    db_name = os.environ.get('DB_NAME', 'DA_Serverless')
    print(f"DB_NAME: {db_name}")
    create_item = {'id': {'S': str(uuid.uuid4())}}

    if firstname:
        create_item['firstname'] = {'S': firstname}
    if lastname:
        create_item['lastname'] = {'S': lastname}
    if email:
        create_item['email'] = {'S': email}

    print(f"Create_item {create_item}")

    try:
        dynamo_db.put_item(TableName=db_name, Item=create_item)
        return True
    except Exception as ex:
        error(f"ERROR: {str(ex)}")
        return False

def lambda_handler(event, context):
    print(f"Event: {event}")

    firstname = event.get('firstname', '')
    lastname = event.get('lastname', '')
    email = event.get('email', '')

    is_success = create_customer(firstname, lastname, email)

    return is_success
