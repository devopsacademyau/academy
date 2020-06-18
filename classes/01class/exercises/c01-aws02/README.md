## S3 (C01-aws02)

- Use the CLI to create a S3 bucket and upload a file to it.
- Access the file on the S3 bucket from any the EC2 instance created in the previous exercise.
- Submit a PR to the DevOpsAcademy repo under the `/classes/01class/exercises/c01-aws02/<github-username>` folder of this class with a brief description of what you did to achieve this objective. The file containing the solution you used must be named README.md

## Submit a PR with the folowing file:
- README.md based on the [ANSWER.md](ANSWER.md) file with the commands requested. 

## References
- [S3 Bucket Creation](https://docs.aws.amazon.com/cli/latest/reference/s3/mb.html)


### Tip:
You can access the file on the S3 bucket by creating an IAM role with a S3 policy(you can use the `AmazonS3ReadOnlyAccess`) and attaching it to your EC2 instance. One of the best practices when creating IAM policies is to grant least privilege to the users. The objective is to initially give the users only the access/permission they need to complete the intended task and grant additional permissions as necessary later. This is more secure than starting with permissions that are too lenient and then trying to tighten them later. 


**Why using least privilege is important:**
Granting full access/excessive permissions might cause potential security breach if the account is compromised. The compromised account could execute malicious code or access sensitive data. 


**Source**: 

https://circleci.com/blog/minimize-risk-using-the-principle-of-least-privilege-and-aws-iam-permissions/
https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#grant-least-privilege


**Useful link on creating custom policy:**

https://aws.amazon.com/blogs/security/use-the-new-visual-editor-to-create-and-modify-your-aws-iam-policies/