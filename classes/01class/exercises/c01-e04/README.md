## S3(C01-E04)

- Create a S3 bucket and upload a file to it
- Access the file on the S3 bucket from  any the EC2 instance created in the previous exercise or from a new instance
- Submit a PR to the DevOpsAcademy repo under the `/classes/01class/exercises/c01-e04/<github-username>` folder of this class with a brief description of what you did to achieve this objective. The file containing the solution you used must be named c01-e04.txt


### Tip:
You can access the file on the S3 bucket by creating an IAM role with S3 policy and attaching it to your EC2 instance. One of the best practices when creating IAM policies is to grant least privilege to the users. The objective is to initially give the users only the access/permission they need to complete the intended task and grant additional permissions as necessary later. This is more secure than starting with permissions that are too lenient and then trying to tighten them later. 


**Why using least privilege is important:**
Granting full access/excessive permissions might cause potential security breach if the account is compromised. The compromised account could execute malicious code or access sensitive data. 


**Source**: 

https://circleci.com/blog/minimize-risk-using-the-principle-of-least-privilege-and-aws-iam-permissions/
https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#grant-least-privilege


**Useful link on creating custom policy:**

https://aws.amazon.com/blogs/security/use-the-new-visual-editor-to-create-and-modify-your-aws-iam-policies/