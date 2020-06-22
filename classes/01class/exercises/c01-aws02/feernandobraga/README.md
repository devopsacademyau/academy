# C01-AWS02

## Commands Execution Output

- ### Commands to create the S3 Bucket and to copy the file to the bucket:

  - Create a S3 bucket
    - `aws s3 mb s3://c01-aws02`
  - Upload a file to the bucket
    - `aws s3 cp bucket-file.txt s3://c01-aws02`

- ### Commands to allow the EC2 instance to access the files in S3:

  - Create a trust policy (myTrustPolicy.json)

    ```
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Principal": {
            "Service": "ec2.amazonaws.com"
          },
          "Action": "sts:AssumeRole"
        }
      ]
    }
    ```

  - Create an IAM Role based on the trust policy

    ```
      aws iam create-role --role-name myNewRole --assume-role-policy-document "file:///Users/fernandobraga/Workspace/DevOps Academy/AWS/myTrustPolicy.json"
    ```

  - Create the access policy to the bucket with get and list (ec2-to-s3-policy.json.json)

    ```
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Action": ["s3:Get*", "s3:List*"],
          "Resource": ["arn:aws:s3:::c01-aws02/*", "arn:aws:s3:::c01-aws02"]
        }
      ]
    }
    ```

  - Add the role to the policy
    ```
    aws iam put-role-policy --role-name myNewRole --policy-name ec2-to-s3-policy --policy-document "file:///Users/fernandobraga/Workspace/DevOps Academy/AWS/ec2-to-s3-policy.json"
    ```

* Add access role to the recently created instance profile

  ```
  aws iam add-role-to-instance-profile --instance-profile-name instance-profile-s3-access-from-ec2 --role-name myNewRole
  ```

* Attach the instance profile to an existing EC2 instance

  ```
  aws ec2 associate-iam-instance-profile --instance-id i-004fc9f66474ead64 --iam-instance-profile Name=instance-profile-s3-access-from-ec2
  ```

* ### Commands to copy the S3 file to a folder inside the instance (executed from inside the EC2 Instance):

  - Coping the s3 file

    ```
    aws s3 cp s3://c01-aws02/bucket-file.txt bucket-file.txt
    ```

  - Output
    ```
    download: s3://c01-aws02/bucket-file.txt to ./bucket-file.txt
    [ec2-user@ip-172-31-41-24 ~]$ cat bucket-file.txt
    I'm a happy bucket file
    ```

* ### Add a brief description of the challenges you faced:
  ```
  To be honest, everything AWS related has been extremely challenging for me. I had no previous experience with AWS (and any cloud computing solutions).
  ```

---

Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)
