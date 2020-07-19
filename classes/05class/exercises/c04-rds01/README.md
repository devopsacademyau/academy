# Create a RDS Instance (c04-rds01)

In this exercise, you'll need to to create a new RDS Instance using AWS CLI tool. The database instance should have the following characteristics:
- Name: devopsacademy
- Engine: MySQL
- Subnet: Private

You'll also need to create a Database Security Group and attach it to your DB instance during it's creation so you can access the database from an EC2 instance.

Once the database is created, connect to it from an EC2 instance and execute the command `SHOW DATABASES;` in a mysql shell. To connect to the database, can use the mysql cli tool with the following command: `mysql -h localhost -u yourusername`. This will prompt you for the password and you should get into the mysql shell.

## Submit a PR with the following files:
- README.md based on the [ANSWER.md file](ANSWER.md) with a link to all files from your answer. The links are already in the ANSWER.md file, but if you have any additional files, include a link to it.
- db-creation.txt with the output of the aws cli command to create the security group, the database and any additional resource you may create.
- output.txt with the output of the `SHOW DATABASES` command you execute in the new RDS instance 


## References
- [MySQL Connection](https://dev.mysql.com/doc/refman/8.0/en/connecting.html)
- [RDS cli tool](https://docs.aws.amazon.com/cli/latest/reference/rds/index.html#cli-aws-rds)