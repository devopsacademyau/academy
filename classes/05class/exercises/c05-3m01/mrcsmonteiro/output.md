Explanation and outputs of the following commands: make create_bucket, make delete_bucket

```
###########################################################
# Makefile is configured to prompt user for bucket names  #
###########################################################

# run 'make create_bucket' and type the bucket name to be created:
➜  mrcsmonteiro git:(mrcsmonteiro/c05-3m01) ✗ make create_bucket 
Bucket name: mrcsmonteiro.c05.3m01
Creating network "mrcsmonteiro_default" with the default driver
bash scripts/create_bucket.sh
make_bucket: mrcsmonteiro.c05.3m01

# run 'make delete_bucket' and type the bucket name to be removed:
➜  mrcsmonteiro git:(mrcsmonteiro/c05-3m01) ✗ make delete_bucket 
Bucket name: mrcsmonteiro.c05.3m01
bash scripts/delete_bucket.sh
remove_bucket: mrcsmonteiro.c05.3m01

# run 'make clean' to cleanup the environment:
➜  mrcsmonteiro git:(mrcsmonteiro/c05-3m01) ✗ make clean 
docker-compose down --remove-orphans
Removing network mrcsmonteiro_default
```