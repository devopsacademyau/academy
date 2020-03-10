# CLI + IAM: Create a new user with read only access to S3 (c04-iam01)

Using ***only CLI commands***, do the following:

1. Create a new IAM User via CLI called `user_readonly_S3`
   1. Tip: `aws iam create-user help`
2. Create a new Policy (via CLI) called `S3readOnly` that ALLOWS only S3 reads on every S3 resource. Take note of the created Policy ARN.
   1. Tip 1: https://docs.aws.amazon.com/cli/latest/reference/iam/create-policy.html
   2. Tip 2, actions: 
   ```
	"s3:Get*"
	"s3:List*"
	 ```
3. Attach the policy to the user (via CLI)
   1. Tip: `attach-user-policy` command
4. Create a new Access Key (and secret) for this new user.
5. Configure a new AWS CLI profile called `s3ReadOnlyProfile` using the credentials from the previous step.
6. The the new user access to S3 using the CLI, run:
```
aws s3 ls --profile s3ReadOnlyProfile
```

> No problem if you don't have S3 buckets created, the last CLI command above should not throw any error

## Submit a PR with the following files:
- **README.md**, based on the [ANSWER.md file](ANSWER.md) with a link to all files from your answer. The links are already in the ANSWER.md file, but if you have any additional files, include a link to it.
- **commands.txt**, with each command executed above in the CLI and its associated output.

## References
- [AWS IAM CLI commands](https://docs.aws.amazon.com/cli/latest/reference/iam/index.html#cli-aws-iam)