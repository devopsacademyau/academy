z@bacon:~/Documents/GitHub/academy/classes/05class/exercises/c05-3m01/zarajoy$ git commit -m "add working script"
[zarajoy/c05-s301 6044329e] add working script
 7 files changed, 37 insertions(+)
 delete mode 100644 classes/05class/exercises/c05-3m01/zarajoy/create_bucket.sh
 delete mode 100644 classes/05class/exercises/c05-3m01/zarajoy/delete_bucket.sh
 create mode 100755 classes/05class/exercises/c05-3m01/zarajoy/scripts/create_bucket.sh
 create mode 100644 classes/05class/exercises/c05-3m01/zarajoy/scripts/delete_bucket.sh
z@bacon:~/Documents/GitHub/academy/classes/05class/exercises/c05-3m01/zarajoy$ make create_bucket BUCKET_NAME=helloiamabucketyo
echo Creating S3 Bucket helloiamabucketyo 
Creating S3 Bucket helloiamabucketyo
BUCKET_NAME=helloiamabucketyo docker-compose run --rm aws make _create_bucket
bash scripts/create_bucket.sh
creating bucket
make_bucket: helloiamabucketyo
z@bacon:~/Documents/GitHub/academy/classes/05class/exercises/c05-3m01/zarajoy$ make delete_bucket BUCKET_NAME=helloiamabucketyo
echo Deleteing S3 Bucket helloiamabucketyo 
Deleteing S3 Bucket helloiamabucketyo
BUCKET_NAME=helloiamabucketyo docker-compose run --rm aws make _delete_bucket
bash scripts/delete_bucket.sh
deleting bucket
remove_bucket: helloiamabucketyo
z@bacon:~/Documents/GitHub/academy/classes/05class/exercises/c05-3m01/zarajoy$ make create_bucket BUCKET_NAME=helloiamabucketyo
echo Creating S3 Bucket helloiamabucketyo 
Creating S3 Bucket helloiamabucketyo
BUCKET_NAME=helloiamabucketyo docker-compose run --rm aws make _create_bucket
bash scripts/create_bucket.sh
creating bucket
make_bucket: helloiamabucketyo
z@bacon:~/Documents/GitHub/academy/classes/05class/exercises/c05-3m01/zarajoy$ aws s3 ls
2020-08-16 13:23:22 devops-wordpress-group1
2020-08-22 15:08:07 helloiamabucketyo
2020-08-22 13:48:53 zarajoy
2020-06-19 12:48:59 zarajoy-aws02-bucket
2020-06-08 14:52:18 zarajoybucket
2020-06-21 11:30:28 zjdoa-bucket
z@bacon:~/Documents/GitHub/academy/classes/05class/exercises/c05-3m01/zarajoy$ make delete_bucket BUCKET_NAME=helloiamabucketyo
echo Deleteing S3 Bucket helloiamabucketyo 
Deleteing S3 Bucket helloiamabucketyo
BUCKET_NAME=helloiamabucketyo docker-compose run --rm aws make _delete_bucket
bash scripts/delete_bucket.sh
deleting bucket
remove_bucket: helloiamabucketyo
z@bacon:~/Documents/GitHub/academy/classes/05class/exercises/c05-3m01/zarajoy$ aws s3 ls
2020-08-16 13:23:22 devops-wordpress-group1
2020-08-22 13:48:53 zarajoy
2020-06-19 12:48:59 zarajoy-aws02-bucket
2020-06-08 14:52:18 zarajoybucket
2020-06-21 11:30:28 zjdoa-bucket
z@bacon:~/Documents/GitHub/academy/classes/05class/exercises/c05-3m01/zarajoy$ 
