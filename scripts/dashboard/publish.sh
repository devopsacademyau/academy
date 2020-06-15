#!/bin/bash
cd /app/scripts/dashboard

export CHART_DATE=$(date +%Y-%m-%d)

echo "Saving files to S3"
aws s3 cp ./chart.png s3://devopsacademy.com.au/progression-chart/chart-${CHART_DATE}.png

echo "Preparing the json payload"
sed -i "s,PUBLISH_URL,$PUBLISH_URL,g" slack_payload.json
sed -i "s,SLACK_CHANNEL,$SLACK_CHANNEL,g" slack_payload.json
sed -i "s,CHART_DATE,$CHART_DATE,g" slack_payload.json
sed -i "s,PUBLISH_URL,$PUBLISH_URL,g"  slack_payload.json

cat ./slack_payload.json

echo "Publishing Slack message"
curl -X POST -H 'Content-type: application/json' \
  ${SLACK_WEBHOOK} \
  -d @slack_payload.json