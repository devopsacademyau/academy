# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
z@bacon:~$ aws s3api create-bucket --bucket zarajoy-aws02-bucket --region ap-southeast-2 --create-bucket-configuration LocationConstraint=ap-southeast-2
{
    "Location": "http://zarajoy-aws02-bucket.s3.amazonaws.com/"
}
z@bacon:~$ aws s3 cp ./Documents/upload.txt s3://zarajoy-aws02-bucket

upload: Documents/upload.txt to s3://zarajoy-aws02-bucket/upload.txt

z@bacon:~$ aws s3 ls zarajoy-aws02-bucket

2020-06-19 12:53:14         16 upload.txt


```

- Commands to allow the EC2 instance to access the files in S3:
```
Add your commands and their outputs here
```

- Commands to copy the S3 file to a folder inside the instace (executed from inside the EC2 Instance):
```
Add your commands and their outputs here
```

- Add a brief description of the challenges you faced:
```
Add comments here
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)