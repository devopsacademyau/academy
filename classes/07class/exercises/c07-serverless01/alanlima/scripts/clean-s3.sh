# echo $BUCKET_NAME

if [ -z "$BUCKET_NAME" ]; then
    echo "Missing env: BUCKET_NAME"
    exit 1
fi

echo "Deleting objects from bucket $BUCKET_NAME"

aws s3 ls s3://$BUCKET_NAME \
    | awk '{print $4}' \
    | xargs -I{} aws s3 rm s3://$BUCKET_NAME/{}