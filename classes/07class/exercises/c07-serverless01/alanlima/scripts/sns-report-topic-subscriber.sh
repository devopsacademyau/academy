if [ -z "$SNS_REPORT_TOPIC_ARN" ]; then
    echo "Missing env: SNS_REPORT_TOPIC_ARN"
    exit 1
fi

if [ -z "$SNS_REPORT_EMAIL" ]; then
    echo "Missing env: SNS_REPORT_EMAIL"
    exit 1
fi

echo "Creating subscription for topic $SNS_REPORT_TOPIC_ARN"

aws sns subscribe \
    --topic-arn $SNS_REPORT_TOPIC_ARN \
    --protocol email \
    --notification-endpoint $SNS_REPORT_EMAIL

echo "Please check your e-mail to confirm the subscription."