import os
import uuid
import boto3
import base64
import json
import datetime
from logging import error
from common import get_ssm_parameter

def create_customer(firstname, lastname, email):
    dynamo_db = boto3.client('dynamodb')
    db_name = get_ssm_parameter(os.environ.get('DB_NAME'))
    print(f"DB_NAME: {db_name}")
    create_item = {'id': {'S': str(uuid.uuid4())}}

    if firstname:
        create_item['firstname'] = {'S': firstname}
    if lastname:
        create_item['lastname'] = {'S': lastname}
    if email:
        create_item['email'] = {'S': email}

    create_item['created_time'] = {'S': datetime.datetime.utcnow().isoformat()+'Z' }

    print(f"Create_item {create_item}")

    try:
        dynamo_db.put_item(TableName=db_name, Item=create_item)
        return True
    except Exception as ex:
        error(f"ERROR: {str(ex)}")
        resp = {
            "isBase64Encoded": False,
            "statusCode": 500,
            "body": "Server error: " + str(ex)
        }
        return resp

def lambda_handler(event, context):
    print(f"Event: {event}")

    body = event.get('body', '')
    isBase64Encoded = event.get('isBase64Encoded', True)
    
    print(f"body content: {body}")

    if not body:
        resp = {
            "isBase64Encoded": False,
            "statusCode": 400,
            "body": "Bad Request: invalid body, should contain 'firstname'."
        }
        return resp
    
    raw_body = base64.b64decode(body) if isBase64Encoded else body
    
    try:
        json_body = json.loads(raw_body)
    except:
        resp = {
            "isBase64Encoded": False,
            "statusCode": 400,
            "body": "Bad Request: Body must be valid JSON."
        }
        return resp

    firstname = json_body.get('firstname', '')
    lastname = json_body.get('lastname', '')
    email = json_body.get('email', '')

    is_success = create_customer(firstname, lastname, email)

    if is_success is True:
        resp = {
            "isBase64Encoded": False,
            "statusCode": 201
        }
        return resp
    else:
        resp = {
            "isBase64Encoded": False,
            "statusCode": 500,
            "body": "Internal server error."
        }
        return resp
