#!/bin/bash
cd /app/scripts/dashboard
mkdir -p ~/.config/gspread/
echo $GOOGLE_KEY |base64 -d > ~/.config/gspread/service_account.json
./dashboard.sh
python3 dashboard.py

aws s3 ls

curl -X POST -H 'Content-type: application/json' \
  ${SLACK_WEBHOOK} \
  --data '{
  "channel": "test-automation",
  "blocks": [
    {
      "type": "section",
      "text": {
        "type": "mrkdwn",
        "text": ":siren-alert: *Updated Labs Progression! Lets get those lines to infinity and beyond!* :siren-alert:"
      }
    },
    {
      "type": "image",
      "title": {
        "type": "plain_text",
        "text": "Updated Progression"
      },
      "block_id": "image4",
      "image_url": "http://placekitten.com/500/500",
      "alt_text": "Labs Progression"
    }
  ]
}'