# AWS VPC + subnets

Everything is to be done preferable on Sydney region `ap-southeast-2`

## Route Table (rt)

Create the above route tables and associate with referred subnets:

|route table|subnet|
|devopsacademy-rt-public|all public subnets|
|devopsacademy-rt-private|all private subnets|

## Routes

Add the following routes to your new route tables:

- devopsacademy-rt-public

|destination|target|
|-|-|
|0.0.0.0|`devopsacademy-igw`|

- devopsacademy-rt-private

|destination|target|
|-|-|
|0.0.0.0|`devopsacademy-ngw`|

#### Then post your answers for the following:

- How did you accomplish both instructions?
- Why did you add 0.0.0.0 route to the IGW on public route table?
- Why did you add 0.0.0.0 route to the NGW on private route table?
- What is the difference of IGW and NGW?
- Can you delete the destination route to your VPC network? Why?
- What happens if you do not associate your route table with any subnets?

## Submit a PR with the following files

> Remember to follow the instructions on [how to submit a PR here](/README.md#exercises)s

- **README.md**: copy from file [ANSWER.md](ANSWER.md), containing your answers.
