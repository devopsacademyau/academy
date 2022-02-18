# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table
```
First we create both security groups:
➜  ~ aws ec2 create-security-group  --group-name public-sg --description "SSH access to AWS" --vpc-id vpc-01cf6494735903d97
-------------------------------------
|        CreateSecurityGroup        |
+----------+------------------------+
|  GroupId |  sg-0c811d6dc3469e9e3  |
+----------+------------------------+


➜  ~ aws ec2 create-security-group  --group-name private-sg --description "SSH access from public aws to private aws servers" --vpc-id vpc-01cf6494735903d97

-------------------------------------
|        CreateSecurityGroup        |
+----------+------------------------+
|  GroupId |  sg-0b173087fa4c40d38  |
+----------+------------------------+
Then we add to each the ingress rules on port 22, taking care to use my public ip for public and the other SG as the ingress for the private network:

aws ec2 authorize-security-group-ingress --group-id sg-0c811d6dc3469e9e3  --protocol tcp  --port 22  --cidr 167.179.158.84/32
------------------------------------------------------------------------------------------------------------------------------------------
|                                                      AuthorizeSecurityGroupIngress                                                     |
+---------------------------------------------------------------------------+------------------------------------------------------------+
|  Return                                                                   |  True                                                      |
+---------------------------------------------------------------------------+------------------------------------------------------------+
||                                                          SecurityGroupRules                                                          ||
|+-------------------+-----------+-----------------------+---------------+-------------+-----------+-------------------------+----------+|
||     CidrIpv4      | FromPort  |        GroupId        | GroupOwnerId  | IpProtocol  | IsEgress  |   SecurityGroupRuleId   | ToPort   ||
|+-------------------+-----------+-----------------------+---------------+-------------+-----------+-------------------------+----------+|
||  167.179.158.84/32|  22       |  sg-0c811d6dc3469e9e3 |  738343455957 |  tcp        |  False    |  sgr-093764d82d126a739  |  22      ||
|+-------------------+-----------+-----------------------+---------------+-------------+-----------+-------------------------+----------+|
aws ec2 authorize-security-group-ingress  --group-id sg-0b173087fa4c40d38  --protocol tcp  --port 22 --source-group sg-0c811d6dc3469e9e3

---------------------------------------------------------------------------------------------------------------------
|                                           AuthorizeSecurityGroupIngress                                           |
+---------------------------------------------------------------+---------------------------------------------------+
|  Return                                                       |  True                                             |
+---------------------------------------------------------------+---------------------------------------------------+
||                                               SecurityGroupRules                                                ||
|+----------+-----------------------+---------------+-------------+-----------+-------------------------+----------+|
|| FromPort |        GroupId        | GroupOwnerId  | IpProtocol  | IsEgress  |   SecurityGroupRuleId   | ToPort   ||
|+----------+-----------------------+---------------+-------------+-----------+-------------------------+----------+|
||  22      |  sg-0b173087fa4c40d38 |  738343455957 |  tcp        |  False    |  sgr-066400ca2880b6d79  |  22      ||
|+----------+-----------------------+---------------+-------------+-----------+-------------------------+----------+|
|||                                              ReferencedGroupInfo                                              |||
||+----------------------------------+----------------------------------------------------------------------------+||
|||  GroupId                         |  sg-0c811d6dc3469e9e3                                                      |||
||+----------------------------------+----------------------------------------------------------------------------+||




```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)