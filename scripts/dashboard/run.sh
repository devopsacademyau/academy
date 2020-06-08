#!/bin/bash
cd /app/scripts/dashboard
mkdir -p ~/.config/gspread/
echo $GOOGLE_KEY |base64 -d > ~/.config/gspread/service_account.json
./dashboard.sh
python3 dashboard.py

aws s3 cp scripts/dashboard/chart.png s3://devopsacademy.com.au/progression-chart/chart.png

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
      "image_url": "http://devopsacademy.com.au/progression-chart/chart.png",
      "alt_text": "Labs Progression"
    }
  ]
}'