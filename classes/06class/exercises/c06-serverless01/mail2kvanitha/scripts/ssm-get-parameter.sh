KEY_NAME=$1
#aws ssm get-parameters --name API-Key --with-decrypt
aws ssm get-parameters --name $KEY_NAME --with-decrypt
