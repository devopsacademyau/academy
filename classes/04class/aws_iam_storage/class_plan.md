1. Present AWS CLI **(10 min)**
   1. Installation
   2. Configuration --> Get IAM user credentials
   3. 1 example of command (aws s3 ls)

2. AWS IAM **(25 min)**
   1. Laptop - intro + four pillars **(5 min)**
   2. Whiteboard - explain / quiz with students **(10 min)**
      1. Users
      2. Policies
      3. Permission
      4. Groups
      5. Roles
   3. Laptop - show structure of a Policy **(10 min)**
      1. Quiz with students about what it does
   4. Laptop - assume role demo **(5 min)**

3. AWS S3 **(20 min)**
   1. Whiteboard - intro **(10 min)**
      1. present 4 common use cases
      1. Main concepts (bucket, object, key, prefix) 
   2. Laptop - create bucket: **(5 min)**
      1. Demo - process of creating a bucket and uploading a file (index.html)
         1. Try to open index.html URL --> Access Denied. Why?
         2. Click in `Open` to open index.html. It works. Why?
         3. Change bucket public block to OFF
         4. Try again to open index.html URL --> Access Denied. Why?
         5. Change OBJECT permission to public --> It works.
   3. Laptop - Bucket policy - website **(5 min)**
      1. Static Website
         1. Enable static website hosting
         2. Share a bucket with another AWS account - ACL or bucket policy?
         3. Test with CLI

```
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::281387974444:user/denis"
            },
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::devopsacademy.ml/*"
        }
```

4. AWS RDS **(15 min)**
   1. Laptop - intro 
   2. Whiteboard