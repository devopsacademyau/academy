# C01-AWS01

## Commands Execution Output

- ### Commands to create the first EC2 instance and any additional resource required:

  - Creating a Key Pair

    - `aws ec2 create-key-pair --key-name JBoxKey --query 'KeyMaterial' --output text > JBoxKey.pem`

  - Protecting the Key

    - `chmod 400 JBoxKey.pem`

  - Creating a Security Group

    - `aws ec2 create-security-group --group-name SSH-only-Whitelisted --description "SSH only accessible from whitelisted ip" --vpc-id vpc-4be0e92c`
      - group returned was: `sg-0f4bae70d4fa088db`

  - Configuring a security group

    - `aws ec2 authorize-security-group-ingress --group-id sg-0f4bae70d4fa088db --protocol tcp --port 22 --cidr 203.219.215.205/32`

  - Running the first EC2 instance

    - `aws ec2 run-instances --image-id ami-088ff0e3bde7b3fdf --count 1 --instance-type t2.micro --key-name JBoxKey --security-group-ids sg-0f4bae70d4fa088db --associate-public-ip-address`

  - Retrieving Public DNS Name
    - `aws ec2 describe-instances --query "Reservations[*].Instances[*].PublicDnsName" --output=text`
      - it returned: `ec2-13-236-188-118.ap-southeast-2.compute.amazonaws.com`

* ### Commands to connect to the first EC2 instance:

  - `ssh -i JBoxKey.pem ec2-user@ec2-13-236-188-118.ap-southeast-2.compute.amazonaws.com`

- ### Commands to create the second EC2 instance and any additional resource required:

  - Creating a New Key Pair

    - `aws ec2 create-key-pair --key-name ec2LinuxServer --query 'KeyMaterial' --output text > ec2LinuxServer.pem`

    - Protecting the Key

      - `chmod 400 ec2LinuxServe.pem`

    - Creating a Security Group

      - `aws ec2 create-security-group --group-name SSH-only-JBox --description "SSH only accessible from Jump Box" --vpc-id vpc-4be0e92c`
        - group returned was: `sg-02aeeee0b904020d6`

    - Configuring a security group

      - `aws ec2 authorize-security-group-ingress --group-id sg-02aeeee0b904020d6 --protocol tcp --port 22 --cidr 172.31.41.24/32`

    - Running the second EC2 instance

      - `aws ec2 run-instances --image-id ami-088ff0e3bde7b3fdf --count 1 --instance-type t2.micro --key-name ec2LinuxServer --security-group-ids sg-02aeeee0b904020d6 --no-associate-public-ip-address`

    - Retrieving the Private IP address
      - `aws ec2 describe-instances --query "Reservations[*].Instances[*].PrivateIpAddress" --output=text`
        - it returned: `172.31.34.134`

- ### Commands to connect to the second EC2 instance:

  - Add key to keychain

    - `ssh-add ec2LinuxServer.pem`

  - Now connect to JumpBox

    - `ssh -A ec2-user@ec2-13-236-188-118.ap-southeast-2.compute.amazonaws.com`

  - From the JumpBox, connect to the LinuxServer

    - `ssh ec2-user@172.31.34.134`

---

Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws01/README.md)
