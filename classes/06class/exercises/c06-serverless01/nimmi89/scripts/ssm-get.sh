aws ssm get-parameter \
    --name API_KEY  \
    --with-decryption \
    --query 'Parameter.[Value]'