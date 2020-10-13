#!/usr/bin/env sh
  echo $email_id
  aws sns subscribe --topic-arn "$sns_arn" --protocol email --notification-endpoint "$email_id"