import os
import boto3
from boto3.dynamodb.conditions import Key

def get_ssm_parameter(name):
    ssm = boto3.client('ssm')
    parameter = ssm.get_parameter(Name=name)
    print(f"get parameter {parameter}")
    return parameter['Parameter']['Value']

def get_db():
    dynamo_db = boto3.resource("dynamodb")
    db_name = get_ssm_parameter(os.environ.get('DB_NAME'))
    table = dynamo_db.Table(db_name)
    return table

def get_customer_by_email(email):
    print(f"getting customer by email: {email}")
    table = get_db()
    # customer = table.get_item(Key={"email": {'S': email}}).get('Item')
    customers = table.scan(
        FilterExpression=Key('email').eq(email)
    ).get('Items')

    return customers[0] if len(customers) > 0 else None

def get_customers_count():
    print(f"getting customers count..")
    table = get_db()
    response = table.scan(
        Select="COUNT"
    )
    return response.get('Count', 0)