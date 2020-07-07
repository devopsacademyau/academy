# Load Balancing

Create an Application Load Balancer with the following details and post:

- scheme: `public-facing`
- listener:
  - `HTTP > PORT 80`
- AZ:
  - use same public AZ's from the last exercise
- Security Group:
  - accessible anywhere from the internet
- target group:
  - type: `instance`
  - protocol: `http`
  - port: `80`
  - register instances created by ASG


It might take a few minutes for the load balancer to be created and active.

## Submit a PR with the following files

> Remember to follow the instructions on [how to submit a PR here](/README.md#exercises)s

- **README.md**: copy from file [ANSWER.md](ANSWER.md), containing your answers.
