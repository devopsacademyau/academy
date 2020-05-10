### Create Bucket
After creating the necessary files, I ran make create_bucket in my console

```Successfully built 08b41a44ca90
Successfully tagged starkmatt_aws:latest
WARNING: Image for service aws was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.
bash scripts/create_bucket.sh
make_bucket: devopsacademy-s3make```

It began the long process of building the the docker container, and it's commands in the Dockerfile such as curl, make, unzip, sudo, python3 for the AWS CLI
After the build complete was complete, I saw the output mentioned above.
I logged into AWS and saw that the bucket was created.

### Delete Bucket
```➜  starkmatt git:(starkmatt/c05-3m01) ✗ make delete_bucket 
docker-compose run --rm aws make _delete_bucket
bash scripts/delete_bucket.sh
remove_bucket: devopsacademy-s3make```

After running the delete command, the output above returned.
Checked in AWS the s3 bucket had been deleted.

