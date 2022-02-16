## Command Execution Output
***
### Make Create Bucket
`➜  jithinjabraham git:(jithinjabraham/c05-3m01) ✗ make create_bucket
docker-compose run --rm awscli-container make _create_bucket
Creating network "jithinjabraham_default" with the default driver
Creating jithinjabraham_awscli-container_run ... done
bash scripts/create_bucket.sh
make_bucket: 3m-dojo`

### Make Delete Bucket
`➜  jithinjabraham git:(jithinjabraham/c05-3m01) ✗ make delete_bucket
docker-compose run --rm awscli-container make _delete_bucket
Creating jithinjabraham_awscli-container_run ... done
bash scripts/delete_bucket.sh
remove_bucket: 3m-dojo`