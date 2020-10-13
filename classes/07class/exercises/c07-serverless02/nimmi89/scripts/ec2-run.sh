aws ec2 run-instances \
    --image-id ami-0099823645f06b6a1 \
    --count 1 \
    --instance-type t2.micro \
    --key-name C01-AWS01KeyPair \
    --tag-specifications ResourceType=instance,Tags=[{Key=${TAG_NAME},Value=cc1}]


