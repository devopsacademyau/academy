if [ -z "$SNS_TOPIC_ARN" ]; then
    echo "Missing env: SNS_TOPIC_ARN"
    exit 1
fi

if [ -z "$SNS_TARGET_EMAIL" ]; then
    echo "Missing env: SNS_TARGET_EMAIL"
    exit 1
fi

echo "Creating subscription for topic $SNS_TOPIC_ARN"

aws sns subscribe \
    --topic-arn $SNS_TOPIC_ARN \
    --protocol email \
    --notification-endpoint $SNS_TARGET_EMAIL

echo "Subscription created..."
echo "Please check your e-mail to confirm the subscription"