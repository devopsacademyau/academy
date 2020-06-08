#!/bin/bash
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
        "text": ":siren-alert: *Updated Labs Progression!* :siren-alert:\n:baby-yoda: Those lines to the top of the chart we need to get. Yes, hrrmmm."
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