#!/bin/bash
echo "deleting bucket..."
aws s3 rb s3://${BUCKET_NAME}