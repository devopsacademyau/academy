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


def send_email(email):
    SENDER = "raghunadhp@gmail.com"
# Replace recipient@example.com with a "To" address. If your account
# is still in the sandbox, this address must be verified.
    RECIPIENT = email
# Specify a configuration set. If you do not want to use a configuration
# set, comment the following variable, and the
# ConfigurationSetName=CONFIGURATION_SET argument below.
    CONFIGURATION_SET = "ConfigSet"

# If necessary, replace us-west-2 with the AWS Region you're using for Amazon SES.

# The subject line for the email.   
    SUBJECT = "Thanks for adding your awesome photo :)"

# The email body for recipients with non-HTML email clients.
    BODY_TEXT = ("Thanks for adding your awesome photo :)")

# The HTML body of the email.
    BODY_HTML = """<html>
        <head></head>
    <body>
    <h1>Awesome Photo</h1>
    <p>Thanks for adding your awesome photo :)</p>
    </body>
    </html>
            """

# The character encoding for the email.
    CHARSET = "UTF-8"

# Create a new SES resource and specify a region.
    client = boto3.client('ses')

# Try to send the email.
    try:
    # Provide the contents of the email.
        response = client.send_email(
            Destination={
                'ToAddresses': [
                    RECIPIENT,
                ],
            },
            Message={
                'Body': {
                    'Html': {
                        'Charset': CHARSET,
                        'Data': BODY_HTML,
                    },
                    'Text': {
                    'Charset': CHARSET,
                    'Data': BODY_TEXT,
                },
            },
            'Subject': {
                'Charset': CHARSET,
                'Data': SUBJECT,
            },
        },
        Source=SENDER,
        # If you are not using a configuration set, comment or delete the
        # following line
    )
# Display an error if something goes wrong.
    except ClientError as e:
        print(e.response['Error']['Message'])
    else:
        print("Email sent! Message ID:"),
        print(response['MessageId'])

def update_photo(imageName):
    dynamodb_client = boto3.client('dynamodb')
    db_name = os.environ.get('DB_NAME', 'DA_Serverless')
    print(f"DB_NAME: {db_name}")
    print(f"imageName: {imageName}")
    emailId = os.path.splitext(imageName)[0]
    print(f"emailId: {emailId}")
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(db_name)
    try:
        response = table.get_item(
            Key={
                'email': emailId
            }
        )
        if 'Item' not in response:
            print(f'no data found')
    except ClientError as e:
        print(e.response['Error']['Message'])
    else:
        data = response['Item']
        data['photo_location'] = imageName
        table.put_item(Item=data)
        print(f'updated  data')
        send_email(emailId)


def photo_handler(event, context):
    print(f"Photo Halder Event: {event}")
    for record in event['Records']:
        bucket = record['s3']['bucket']['name']
        key = unquote_plus(record['s3']['object']['key'])
        print(f"S3 bucket:{bucket}Key{key} ")
        update_photo(key)
