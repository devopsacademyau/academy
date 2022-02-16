# create_bucket.sh
#!/usr/bin/env sh
aws s3 mb s3://${BUCKET_NAME}