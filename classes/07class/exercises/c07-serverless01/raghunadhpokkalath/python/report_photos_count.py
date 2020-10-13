import os
import uuid
import base64
import json
import datetime
import os
from logging import error
from urllib.parse import unquote_plus
import boto3
from boto3.dynamodb.conditions import Key
from botocore.exceptions import ClientError

def get_customer_count():
    db_name = os.environ.get('DB_NAME', 'DA_Serverless')    
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(db_name)
    response = table.scan (Select = "COUNT")
    count = response.get('Count')
    print(f"Dynamo DB Record count: {count}")
    return count 


def report_photos_count(event, context):
    print(f"Dynamo DB Stream Event: {event}")
    sns_arn = os.environ.get('SNS_ARN')
    print(f"sns_arn: {sns_arn}")
    for record in event['Records']:
        if record.get('eventName') == 'INSERT':
            print('fInsert Event')
            cust_count = get_customer_count()
            print('fcustomer count {cust_count}')
            client = boto3.client('sns')
            message = "Number of customer records:{}".format(cust_count)
            client.publish(TopicArn=sns_arn,Message=message)
            return {
                'statusCode': 200,
                'body': json.dumps('Number of records:{cust_count}')
                }