# C05-3M01

## Make
- [Dockerfile](Dockerfile)
- [scripts/create_bucket.sh](scripts/create_bucket.sh)
- [scripts/delete_bucket.sh](scripts/delete_bucket.sh)
- [.env](.env)
- [Makefile](Makefile)
- [output.md](output.md)

## Command Execution Output

ravi.senevirathne@contino.io@Ravis-MacBook-Pro ravisenevirathne % make create_bucket     
docker-compose run 3muskeeters make _create_bucket
bash scripts/create_bucket.sh
***Creating S3 Bucket***
make_bucket: ravisenevirathnes3bucket


ravi.senevirathne@contino.io@Ravis-MacBook-Pro ravisenevirathne % make delete_bucket                           
docker-compose run 3muskeeters make _delete_bucket
bash scripts/delete_bucket.sh
***Removing S3 Bucket***
remove_bucket: ravisenevirathnes3bucket


<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c05-3m01](<WIP>)