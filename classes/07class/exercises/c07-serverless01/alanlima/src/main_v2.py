import os
import uuid
import boto3
import base64
import json
import datetime
from logging import error

def getParameter(name):
    ssm = boto3.client('ssm')
    parameter = ssm.get_parameter(Name=name)
    print(f"get parameter {parameter}")
    return parameter['Parameter']['Value']

def get_db():
    dynamo_db = boto3.resource("dynamodb")
    db_name = getParameter(os.environ.get('DB_NAME'))
    table = dynamo_db.Table(db_name)
    return table

def create_customer(firstname, lastname, email):
    dynamo_db = boto3.client('dynamodb')
    db_name = getParameter(os.environ.get('DB_NAME'))
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

def list_customers():
    table = get_db()
    customers = table.scan()
    
    print(f"Found {customers.get('Count', 0)} records")
    
    return {
        "isBase64Encoded": True,
        "statusCode": 200,
        "body": json.dumps(customers.get('Items', []))
    }

def get_customer(id):
    print(f"get customer: {id}")
    table = get_db()
    customer = table.get_item(Key={"id": id}).get('Item')
    
    if customer:
        return {
            "isBase64Encoded": False,
            "statusCode": 200,
            "body": json.dumps(customer)
        }
    else:
        return {
            "isBase64Encoded": False,
            "statusCode": 404
        }

def handle_invalid(event, context):
    return {
        "isBase64Encoded": False,
        "statusCode": 400,
        "body": "BadRequest: Invalid request type"
    }

def handle_post(event, context):
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

def handle_get(event, context):
    print(f"Handling get items")

    customerId = event.get('queryStringParameters', {}).get('id')

    return get_customer(customerId) if customerId else list_customers()

def lambda_handler(event, context):
    print(f"Event: {event}")

    httpMethod = event.get('httpMethod')

    return {
        'POST': handle_post,
        'GET': handle_get
    }.get(httpMethod, handle_invalid)(event, context)