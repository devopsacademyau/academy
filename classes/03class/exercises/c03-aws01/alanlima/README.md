# C03-aws01

## Attachments

- [User Data Script](user-data.txt)

## Command Execution Output

- Commands used to create your autoscaling group:

    ```bash
    # Create a new Security group to allow connection to port 80
    $ aws ec2 create-security-group \
        --group-name c03-aws01-sg \
        --description "Allow connection to port 80" \
        --vpc-id vpc-08fb60055e82efe81 \
        --tag-specifications "ResourceType=security-group,Tags=[{Key=Name,Value=c03-aws01-sg},{Key=DevopsClass,Value=c03}]"

    GroupId: sg-07739f756a518e82e
    Tags:
    - Key: Name
    Value: c03-aws01-sg
    - Key: DevopsClass
    Value: c03

    # Update the security group to allow ingress from anywhere to port 80
    $ aws ec2 authorize-security-group-ingress \
        --group-id sg-07739f756a518e82e \
        --cidr 0.0.0.0/0 \
        --port 80 \
        --protocol tcp

    # Create the Launch Configuration resource with the template details to be applied for each instance when created
    $ aws autoscaling create-launch-configuration \
        --launch-configuration-name devops-init-instance-data \
        --user-data file://user-data.txt \
        --image-id ami-088ff0e3bde7b3fdf \
        --instance-type t2.micro \
        --security-groups sg-07739f756a518e82e
        
    # Describe the launch configuration recent created
    $ aws autoscaling describe-launch-configurations \
        --launch-configuration-names devops-init-instance-data
    ```

    ```yaml
    LaunchConfigurations:
    - BlockDeviceMappings: []
    ClassicLinkVPCSecurityGroups: []
    CreatedTime: '2020-07-08T22:04:09.980000+00:00'
    EbsOptimized: false
    ImageId: ami-088ff0e3bde7b3fdf
    InstanceMonitoring:
        Enabled: true
    InstanceType: t2.micro
    KernelId: ''
    KeyName: ''
    LaunchConfigurationARN: arn:aws:autoscaling:ap-southeast-2:097922957316:launchConfiguration:57f72e70-835b-40d7-9217-53f150c72e91:launchConfigurationName/devops-init-instance-data
    LaunchConfigurationName: devops-init-instance-data
    RamdiskId: ''
    SecurityGroups:
    - sg-07739f756a518e82e
    UserData: IyEgL2Jpbi9iYXNoCnl1bSB1cGRhdGUgLXkKeXVtIGluc3RhbGwgLXkgaHR0cGQKY3VybCAxNjkuMjU0LjE2OS4yNTQvbGF0ZXN0L21ldGEtZGF0YS9ob3N0bmFtZSA+IGluZGV4Lmh0bWwKbXYgaW5kZXguaHRtbCAvdmFyL3d3dy9odG1sLwpzeXN0ZW1jdGwgc3RhcnQgaHR0cGQ=
    ```

    ```bash
    # Now we can create the auto scaling group using the launch configuration created
    $ aws autoscaling create-auto-scaling-group \
        --auto-scaling-group-name asg-devops \
        --min-size 1 --max-size 2 --desired-capacity 2 \
        --launch-configuration-name devops-init-instance-data \
        --vpc-zone-identifier "subnet-068860ac143dd2beb" \
        --tags Key=DevopsClass,Value=c03 \
               Key=Name,Value=devops-asg
    
    # Describe the ASG to check 
    $ aws autoscaling describe-auto-scaling-groups
    ```

    ```yaml
    AutoScalingGroups:
    - AutoScalingGroupARN: arn:aws:autoscaling:ap-southeast-2:097922957316:autoScalingGroup:a60f7e94-1562-4be3-947e-d4a55c656954:autoScalingGroupName/asg-devops
    AutoScalingGroupName: asg-devops
    AvailabilityZones:
    - ap-southeast-2a
    CreatedTime: '2020-07-08T22:04:38.385000+00:00'
    DefaultCooldown: 300
    DesiredCapacity: 2
    EnabledMetrics: []
    HealthCheckGracePeriod: 0
    HealthCheckType: EC2
    Instances:
    - AvailabilityZone: ap-southeast-2a
        HealthStatus: Healthy
        InstanceId: i-047c38d32cab72b86
        InstanceType: t2.micro
        LaunchConfigurationName: devops-init-instance-data
        LifecycleState: InService
        ProtectedFromScaleIn: false
    - AvailabilityZone: ap-southeast-2a
        HealthStatus: Healthy
        InstanceId: i-0b79f5dbad02aa509
        InstanceType: t2.micro
        LaunchConfigurationName: devops-init-instance-data
        LifecycleState: InService
        ProtectedFromScaleIn: false
    LaunchConfigurationName: devops-init-instance-data
    LoadBalancerNames: []
    MaxSize: 2
    MinSize: 1
    NewInstancesProtectedFromScaleIn: false
    ServiceLinkedRoleARN: arn:aws:iam::097922957316:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling
    SuspendedProcesses: []
    Tags:
    - Key: DevopsClass
        PropagateAtLaunch: true
        ResourceId: asg-devops
        ResourceType: auto-scaling-group
        Value: c03
    - Key: Name
        PropagateAtLaunch: true
        ResourceId: asg-devops
        ResourceType: auto-scaling-group
        Value: devops-asg
    TargetGroupARNs: []
    TerminationPolicies:
    - Default
    VPCZoneIdentifier: subnet-068860ac143dd2beb
    ```

- Command used to get each asg instance hostname through the webserver

    ```bash
    # List the 
    $ aws ec2 describe-instances \
        --filters "Name=tag-value,Values=c03" \
        --query "Reservations[*].Instances[*].{Id:InstanceId,DnsName:PrivateDnsName,IpAddress:PublicIpAddress,State:State.Name}" \
        --output table

    --------------------------------------------------------------------------------------------------------
    |                                           DescribeInstances                                          |
    +--------------------------------------------------+----------------------+----------------+-----------+
    |                      DnsName                     |         Id           |   IpAddress    |   State   |
    +--------------------------------------------------+----------------------+----------------+-----------+
    |  ip-172-32-0-201.ap-southeast-2.compute.internal |  i-0b79f5dbad02aa509 |  3.24.178.58   |  running  |
    |  ip-172-32-0-204.ap-southeast-2.compute.internal |  i-047c38d32cab72b86 |  54.253.71.189 |  running  |
    +--------------------------------------------------+----------------------+----------------+-----------+
    
    # now we can confirm the hostname 
    $ curl 3.24.178.58
    ip-172-32-0-201.ap-southeast-2.compute.internal

    $ curl 54.253.71.189
    ip-172-32-0-204.ap-southeast-2.compute.internal
    ```

- Details of the security group used on the asg

    ```bash
    $ aws ec2 describe-security-groups --group-id sg-07739f756a518e82e
    ```
    ```yaml
    SecurityGroups:
    - Description: Allow connection to port 80
    GroupId: sg-07739f756a518e82e
    GroupName: c03-aws01-sg
    IpPermissions:
    - FromPort: 80
        IpProtocol: tcp
        IpRanges:
        - CidrIp: 0.0.0.0/0
        Ipv6Ranges: []
        PrefixListIds: []
        ToPort: 80
        UserIdGroupPairs: []
    IpPermissionsEgress:
    - IpProtocol: '-1'
        IpRanges:
        - CidrIp: 0.0.0.0/0
        Ipv6Ranges: []
        PrefixListIds: []
        UserIdGroupPairs: []
    OwnerId: '097922957316'
    Tags:
    - Key: Name
        Value: c03-aws01-sg
    - Key: DevopsClass
        Value: c03
    VpcId: vpc-08fb60055e82efe81
    ```

- what this line is doing? `curl https://169.254.169.254/latest/meta-data/hostname > index.html`

    ```
    We are creating a index.html file with the running instance hostname.
    The IP 169.254.169.254 is a special address where we can retrieve the instance metadata from a running instance. The IP is a link-local-address and it valid only from the instance.
    ```

### Tidy up commands

```bash
# --force-delete option will terminate all instaces created by ASG
$ aws autoscaling delete-auto-scaling-group --auto-scaling-group-name asg-devops --force-delete

$ aws autoscaling delete-launch-configuration --launch-configuration-name devops-init-instance-data
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws01](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws01/README.md)