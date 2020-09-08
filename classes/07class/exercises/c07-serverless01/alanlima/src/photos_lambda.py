import os
import boto3
import re
import urllib.parse
import boto3
from common import *
from logging import error
from botocore.exceptions import ClientError

def handler(event, context):
    print(f"Photos Handler Event: {event}")

    records = event.get('Records')
    for record in records:
        try:
            print(f'processing record {record}')
            process_record(record)
        except Exception as error:
            print(f'could not process record: {error}... skipping')

    return { "isbase64Encoded": False, "statusCode": 200, "body": "OK" }

def process_record(record):
    bucketName, fileName = extract_file_info(record)
    print(f'Handling file {fileName} at {bucketName}')
    customerEmail = parse_customer_email(fileName)
    customer = get_customer_by_email(customerEmail)

    if customer is None:
        print(f'customer not found.')
        return

    print(f'Customer: {customer}')

    photo_location = f"s3://{bucketName}/{urllib.parse.unquote(fileName)}"

    update_photo_location(customer, photo_location)

    send_welcome_email(customer, photo_location)

def parse_customer_email(fileName):
    customerEmail = re.sub("\.[^.]*$", "", fileName)
    customerEmail = urllib.parse.unquote(customerEmail)
    return customerEmail

def extract_file_info(record):
    s3Object = record.get('s3')
    bucket = s3Object.get('bucket')
    fileObject = s3Object.get('object')

    bucketName = bucket.get('name')
    fileName = fileObject.get('key')

    return bucketName, fileName


def update_photo_location(customer, photo_location):
    customerId = customer.get('id')
    print(f"updating photo location to {photo_location} for customer {customerId}")
    table = get_db()

    update_kwargs = {
        "Key": {
            "id": customerId
        },
        "UpdateExpression": "set photo_location=:p",
        "ExpressionAttributeValues": {
            ":p": photo_location
        },
        "ReturnValues": "UPDATED_NEW"
    }

    response = table.update_item(**update_kwargs)

    print(f"update photo location response: {response}")

    return response

def send_welcome_email(customer, photo_location):
    customerEmail = customer.get('email')
    customerName = f"{customer.get('lastname')}, {customer.get('firstname')}"
    print(f"sending welcome e-mail for {customerEmail}")
    email_body_html = f"""<html>
<body>
  <h1>Hello {customerName}</h1>
  <p>This is a confirmation e-mail that your photo was uploated to <strong>{photo_location}</strong>.</p>
</body>
</html>
    """
    client = boto3.client("ses")
    charset = 'UTF-8'
    senderName = os.environ.get('SENDER_NAME', 'DevOps Academy')
    senderMail = os.environ.get('SENDER_EMAIL')

    if not senderMail:
        print('You must specify SENDER_NAME and SENDER_EMAIL to send the welcome e-mail.')
        return

    sender = f"{senderName} <{senderMail}>"

    try:
        response = client.send_email(
            Destination={
                'ToAddresses': [
                    customerEmail
                ]
            },
            Message={
                'Body': {
                    'Html': {
                        'Charset': charset,
                        'Data': email_body_html
                    }
                },
                'Subject': {
                    'Charset': charset,
                    'Data': '[devops-academy] Photo Uploaded Confirmation'
                }
            },
            Source=sender
        )
    except ClientError as e:
        print(e.response['Error']['Message'])
    else:
        print("Email sent! Message ID:"),
        print(response['MessageId'])