#!/bin/bash
echo "[default]" > ~/.aws/credentials
echo "aws_access_key_id = ${AWS_ACCESS_KEY_ID}" >> ~/.aws/credentials
echo "aws_secret_access_key = AWS_SECRET_ACCESS_KEY" >> ~/.aws/credentials


echo "[default]" > ~/.aws/config
echo "output = json" >> ~/.aws/config
echo "region = ap-southeast-2" >> ~/.aws/config

cd /app/scripts/dashboard



aws s3 cp ./chart.png s3://devopsacademy.com.au/progression-chart/chart.png
aws s3api put-object-acl --bucket devopsacademy.com.au --key progression-chart/chart/png --acl public-read

curl -X POST -H 'Content-type: application/json' \
  ${SLACK_WEBHOOK} \
  --data '{
  "channel": "test-automation",
  "blocks": [
    {
      "type": "section",
      "text": {
        "type": "mrkdwn",
        "text": ":siren-alert: *Updated Labs Progression!* :siren-alert:\n:baby-yoda: Those lines to the top we need to get. Yes, hrrmmm."
      }
    },
    {
      "type": "image",
      "title": {
        "type": "plain_text",
        "text": "Updated Progression"
      },
      "block_id": "image4",
      "image_url": "https://devopsacademy.com.au/progression-chart/chart.png",
      "alt_text": "Labs Progression"
    }
  ]
}'