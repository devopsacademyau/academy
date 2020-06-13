# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:

```
aws s3 mb s3://mybucket-exercise

make_bucket: mybucket-exercise

aws s3 cp README.md s3://mybucket-exercise/README.md

upload: ./README.md to s3://mybucket-exercise/README.md

```

- Commands to allow the EC2 instance to access the files in S3:

```
Created a new role into IAM roles on the console with s3ReadOnly Access

Added the role into the EC2 instance using the console

connected to the bucket using SSH

and tested the command

aws s3 ls

2020-06-13 04:37:54 mybucket-exercise

```

- Commands to copy the S3 file to a folder inside the instace (executed from inside the EC2 Instance):

```
aws s3 cp s3://mybucket-exercise/README.md README.md

download: s3://mybucket-exercise/README.md to ./README.md

```

- Add a brief descrition of the challenges you faced:

```

The challanges I had is to create the IAM role and add it to the EC2 instance using the `aws cli` as I couldnt figure out the commands.

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines-->
***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)
