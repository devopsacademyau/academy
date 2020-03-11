# Create a bucket, upload a file and expose a website (c04-s301)

***Use only AWS CLI to complete this exercise***

1. Create a new bucket with name `<your_github_username>` (if it already exists, append the current date to the name, e.g., `denstorti20200311`)
1. Upload the file in `/classes/04class/aws_iam_storage/assets/index.html` to the root of the S3 bucket.
1. Enable the S3 website in the bucket
1. Apply any other commands needed to access the website URL (via CLI only)
  1. Tip: use the policy `s3_bucket_policy.json` in the `assets` folder.
1. Check the result via the website URL created for the bucket

## Submit a PR with the following files:
- README.md based on the [ANSWER.md file](ANSWER.md) with a link to all files from your answer. The links are already in the ANSWER.md file, but if you have any additional files, include a link to it.

- **cli_commands.txt**, with the CLI commands and output to perform each of the steps above.

- **website_url.txt**, with just the static website hosted in your bucket. Example: http://`denstorti20200311.s3-website-ap-southeast-2.amazonaws.com`

## References:
- [S3 CLI](https://docs.aws.amazon.com/cli/latest/reference/s3/index.html) 
- [S3api CLI](https://docs.aws.amazon.com/cli/latest/reference/s3api/)