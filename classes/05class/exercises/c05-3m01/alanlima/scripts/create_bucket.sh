#!/bin/sh

echo "🤖: Ok sir, I will do your job and create the bucket '${BUCKET_NAME}' for you"

aws s3 mb s3://${BUCKET_NAME}

echo "🤖: All Done ✅... bucket created. Enjoy while you can 😏"