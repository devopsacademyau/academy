if [ -z "$SNS_TOPIC_ARN" ]; then
    echo "Missing env: SNS_TOPIC_ARN"
    exit 1
fi

if [ -z "$SNS_TARGET_EMAIL" ]; then
    echo "Missing env: SNS_TARGET_EMAIL"
    exit 1
fi

echo "Getting subscription arn"

SUBSCRIPTION_ARN=$(aws sns list-subscriptions-by-topic \
    --topic-arn $SNS_TOPIC_ARN \
    --query "Subscriptions[?Endpoint=='$SNS_TARGET_EMAIL'].{Arn:SubscriptionArn}" \
    --output text --no-cli-pager)

if [ -z "$SUBSCRIPTION_ARN" ]; then
    echo "Subscription not found"
    exit 0
fi

echo "Unsubscribing: $SUBSCRIPTION_ARN"

aws sns unsubscribe --subscription-arn $SUBSCRIPTION_ARN

echo "Done: target e-mail unsubscribed"