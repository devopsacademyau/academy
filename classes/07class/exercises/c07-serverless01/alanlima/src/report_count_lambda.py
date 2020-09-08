import boto3
import os
from common import get_customers_count

def handler(event, context):
    print(f"report_customers_handler: {event}")

    records = event.get("Records")

    new_records_count = len(inserted_records(records))

    if(new_records_count == 0):
        print('no new records... do not notify')
        return
    
    customers_count = get_customers_count()

    message = f"""
    Records Added: {new_records_count}
    Number of records: {customers_count}
    """

    publish_report(message)

def inserted_records(records):
    return [r for r in records if r.get("eventName") == "INSERT"]

def publish_report(message):
    print(f"publishing message {message}")

    sns = boto3.client('sns')
    topic_arn = os.environ.get('SNS_TOPIC_ARN')

    response = sns.publish(
        TopicArn=topic_arn,
        Message=message,
        Subject="[devops-academy] Customers Report"
    )

    print(response)