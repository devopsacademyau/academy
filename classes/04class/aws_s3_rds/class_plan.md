1. AWS S3 **(20 min)**
   1. Whiteboard - intro **(10 min)**
      1. present 4 common use cases
      2. Main concepts (bucket, object, key, prefix) 
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