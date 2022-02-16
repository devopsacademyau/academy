# delete_bucket.sh
#!/usr/bin/env sh
aws s3 rb s3://${BUCKET_NAME}