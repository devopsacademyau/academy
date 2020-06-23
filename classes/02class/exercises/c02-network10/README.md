# AWS VPC + subnets

Everything is to be done preferable on Sydney region `ap-southeast-2`

## Elastic Network Interface (ENI)

Let's assume our service will need a fixed IP address and that if something happens with the instance we will have to move this IP address to a new one.

Create a new ENI attached to one of your private subnets and give it a fixed IP address within the network range of the chosen subnet.

## Submit a PR with the following files

> Remember to follow the instructions on [how to submit a PR here](/README.md#exercises)s

- **README.md**: copy from file [ANSWER.md](ANSWER.md), containing your answers.
