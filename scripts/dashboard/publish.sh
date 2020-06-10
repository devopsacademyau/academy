#!/bin/bash
cd /app/scripts/dashboard

DATE=$(date +%Y-%m-%d)
echo "Saving files to S3"
aws s3 cp ./chart.png s3://devopsacademy.com.au/progression-chart/chart.png

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
      "image_url": "https://s3-ap-southeast-2.amazonaws.com/devopsacademy.com.au/progression-chart/chart.png",
      "alt_text": "Labs Progression"
    }
  ]
}'