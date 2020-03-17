# Load Balancing

Commit all your answers to a text file `c03-aws02.txt` under your folder name.


### Create an Application Load Balancer with the following details and post:

- how did you achieve that?
- access through your browser your load balancer CNAME record and keep refreshing the browser. What do you see?
- details of the security group used
- public load balancer A record

Details:

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
