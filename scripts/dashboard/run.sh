#!/bin/bash
cd /app/scripts/dashboard
mkdir -p ~/.config/gspread/
echo $GOOGLE_KEY |base64 -d > ~/.config/gspread/service_account.json
./dashboard.sh
python3 dashboard.py

  curl -X POST -H 'Content-type: application/json' \
  --data '{"text":"Hello, World!"}' \
  ${SLACK_WEKHOOK}