#!/bin/bash
cd /app/scripts/dashboard

DATE=$(date +%Y-%m-%d)
echo "Saving files to S3"
ls -la
aws s3 cp ./chart.png s3://devopsacademy.com.au/progression-chart/chart.png
aws s3api put-object-acl --bucket devopsacademy.com.au --key progression-chart/chart.png --acl public-read

echo "Publishing Slack message"
curl -X POST -H 'Content-type: application/json' \
  ${SLACK_WEBHOOK} \
  --data '{
  "channel": "test-automation",
  "blocks": [
    {
      "type": "section",
      "text": {
        "type": "mrkdwn",
        "text": ":siren-alert: *Labs Progression Update!* :siren-alert:\n:baby-yoda: Those lines to the top of the chart we need to get. Yes, hrrmmm."
      }
    },
    {
      "type": "image",
      "title": {
        "type": "plain_text",
        "text": "Updated Progression"
      },
      "block_id": "image4",
      "image_url": "https://devopsacademy.com.au/progression-chart/chart-${DATE}.png",
      "alt_text": "Labs Progression"
    }
  ]
}'