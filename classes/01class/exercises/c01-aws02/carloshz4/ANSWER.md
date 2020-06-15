# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
aws s3 mb s3://da-bucket-carlos
aws s3 cp textfile.txt s3://da-bucket-carlos/textfile.txt
```

### Procedure to allow the EC2 instance to access the files in S3

#### Create IAM policy

	- Log in to the AWS Console
	- Go to IAM
	- Go to Policies
	- Click on "Create Policy"
	- On the Visual Editor, expand "Service" and search and select "S3"
	- Select the access levels "List" and "Read"
	- Then click/expand "Resources"
	- On the "bucket" section click on "Add ARN"
	- On the pop up window add:  "da-bucket-carlos/*" then click "add"
	- Click on "Review Policy"
	- Give the Policy a Name (for instance DA_S3_ReadOnlyPolicy) an Description and click on Create Policy


#### Create IAM Role

	- Still on IAM, go to Roles
	- Create Role
	- Type of entity keep "AWS service". For Case choose EC2, then click on Next:Permissions
	- On the search filter, look for the previously created policy DA_S3_ReadOnlyPolicy and select it. Then click on Next:Tags
	- Add a tag (optional)
	- Give the role a name and description, then click on create role.


#### Assign role to ec2 instance

	- On the console go to EC2
	- Then go to Instances and select the jumphost instance created on exercise c01-aws01.
	- Click on Actions, then hover over Instance Settings and click on "Attach/Replace IAM Role"
	- On the IAM Role dropdown search for the created role "DA_S3_ReadOnlyPolicy" then click on Apply.





- Commands to copy the S3 file to a folder inside the instace (executed from inside the EC2 Instance):

SSH to the jumphost.

The instance was created with Amazon Linux, hence AWS cli is installed by default.

```
aws s3 ls
aws s3 cp  s3://da-bucket-carlos/textfile.txt textfile.txt
```

- Add a brief descrition of the challenges you faced:
```
- On the policy creation and resources I first created with da-bucket-carlos only instead of da-bucket-carlos/* and I was getting access denied
- Another thing was trying to figure out the levels of permisions to give access to in the policy.
```

***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)
