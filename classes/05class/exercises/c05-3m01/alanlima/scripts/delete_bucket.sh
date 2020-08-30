#!/bin/sh

echo "🤖: So I just created the bucket '${BUCKET_NAME}', and now you want to delete?!?"
echo "🤖: Fine, I will do it against my will 😣"

aws s3 rb s3://${BUCKET_NAME}

echo "🤖: As you wish, bucket deleted... ❌❌❌"
echo "🤖: I might have put your most important things inside the bucket and deleted it all together... but who cares??"