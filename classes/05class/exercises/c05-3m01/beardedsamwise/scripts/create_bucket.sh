#!/bin/bash
echo "creating bucket..."
aws s3 mb s3://${BUCKET_NAME}
echo "listing buckets..."
aws s3 ls