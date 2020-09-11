echo "Listing Instances to terminate"

INSTANCES_IDS=$(aws ec2 describe-instances \
		--query 'Reservations[*].Instances[*].{Instance:InstanceId}' \
		--filters "Name=tag-key,Values=untagged-tracker" "Name=instance-state-name,Values=running" \
		--output text \
		--no-cli-pager)

if [ -z "$INSTANCES_IDS" ]; then
    echo "No instance found."
    exit 0
fi

echo "Found instances:"
echo $INSTANCES_IDS

aws ec2 terminate-instances --instance-ids $INSTANCES_IDS --no-cli-pager