import json
import os
import boto3
import jmespath

def lambda_handler(event, context):
    print(event)
    
    tag_name=os.getenv('TAG_NAME', 'CostCentre')
    
    ec2 = boto3.client('ec2')
    
    # list all running instances
    response = ec2.describe_instances(    
        Filters=[
            {
                'Name': 'instance-state-name',
                'Values': [
                    'running',
                ]
            }
        ]
    )
    print(response)
    
    # filter instances missing CostCentre tag
    result = jmespath.search(f'Reservations[].Instances[?!not_null(Tags[?Key == `{tag_name}`].Value)] | [].InstanceId', response)
    print('Filtered results: ' + json.dumps(result))
    
    if result:
        # terminate instances
        ec2.terminate_instances(InstanceIds=result)
        ec2.create_tags(
            Resources=result,
            Tags=[
                {
                    'Key': 'Name',
                    'Value': 'INVALID_TAGS'
                }
            ]
        )
        
        if not os.getenv('SNS_TOPIC', None):
          raise ValueError("Could not find the environment variable SNS_TOPIC")
        
        sns = boto3.client('sns')
        sns.publish(
            TopicArn=os.getenv('SNS_TOPIC', None),
            Message=f'Instances terminated: {json.dumps(result)}'
        )
        
        print('Instances terminated: ' + json.dumps(result))