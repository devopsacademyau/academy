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
        --vpc-id vpc-027019faaf6756407 \
        --tag-specifications "ResourceType=security-group,Tags=[{Key=Name,Value=c03-aws01-sg},{Key=DevopsClass,Value=c03}]"

    GroupId: sg-047873ff7ad58face
    Tags:
    - Key: Name
    Value: c03-aws01-sg
    - Key: DevopsClass
    Value: c03

    # Update the security group to allow ingress from anywhere to port 80
    $ aws ec2 authorize-security-group-ingress \
        --group-id sg-047873ff7ad58face \
        --cidr 0.0.0.0/0 \
        --port 80 \
        --protocol tcp

    # Create the Launch Configuration resource with the template details to be applied for each instance when created
    $ aws autoscaling create-launch-configuration \
        --launch-configuration-name devops-init-instance-data \
        --user-data file://user-data.txt \
        --image-id ami-088ff0e3bde7b3fdf \
        --instance-type t2.nano \
        --security-groups sg-047873ff7ad58face \
        --associate-public-ip-address \
        --key-name kp-devops
        
    # Describe the launch configuration recent created
    $ aws autoscaling describe-launch-configurations \
        --launch-configuration-names devops-init-instance-data
    ```

    ```yaml
    LaunchConfigurations:
    - AssociatePublicIpAddress: true
      BlockDeviceMappings: []
      ClassicLinkVPCSecurityGroups: []
      CreatedTime: '2020-07-11T08:16:54.104000+00:00'
      EbsOptimized: false
      ImageId: ami-088ff0e3bde7b3fdf
      InstanceMonitoring:
        Enabled: true
      InstanceType: t2.nano
      KernelId: ''
      KeyName: kp-devops
      LaunchConfigurationARN: arn:aws:autoscaling:ap-southeast-2:097922957316:launchConfiguration:a141c3e2-cdd0-4df7-b8dd-d17e0ed0c634:launchConfigurationName/devops-init-instance-data
      LaunchConfigurationName: devops-init-instance-data
      RamdiskId: ''
      SecurityGroups:
      - sg-047873ff7ad58face
      UserData: IyEgL2Jpbi9iYXNoCnl1bSB1cGRhdGUgLXkKeXVtIGluc3RhbGwgLXkgaHR0cGQKY3VybCAxNjkuMjU0LjE2OS4yNTQvbGF0ZXN0L21ldGEtZGF0YS9ob3N0bmFtZSA+IGluZGV4Lmh0bWwKbXYgaW5kZXguaHRtbCAvdmFyL3d3dy9odG1sLwpzeXN0ZW1jdGwgc3RhcnQgaHR0cGQ=
    ```

    ```bash
    # Now we can create the auto scaling group using the launch configuration created
    $ aws autoscaling create-auto-scaling-group \
        --auto-scaling-group-name asg-devops \
        --min-size 1 --max-size 2 --desired-capacity 2 \
        --launch-configuration-name devops-init-instance-data \
        --vpc-zone-identifier "subnet-0f82d6e49b9a6dafd,subnet-0299eb6eb289cef54" \
        --tags Key=DevopsClass,Value=c03 \
               Key=Name,Value=devops-asg
    
    # Describe the ASG to check 
    $ aws autoscaling describe-auto-scaling-groups
    ```

    ```yaml
    AutoScalingGroups:
    - AutoScalingGroupARN: arn:aws:autoscaling:ap-southeast-2:097922957316:autoScalingGroup:00bd7b4f-1b19-4cb1-8dcf-c9e7aa203249:autoScalingGroupName/asg-devops
      AutoScalingGroupName: asg-devops
      AvailabilityZones:
      - ap-southeast-2b
      - ap-southeast-2a
      CreatedTime: '2020-07-11T08:18:35.252000+00:00'
      DefaultCooldown: 300
      DesiredCapacity: 2
      EnabledMetrics: []
      HealthCheckGracePeriod: 0
      HealthCheckType: EC2
      Instances:
      - AvailabilityZone: ap-southeast-2a
        HealthStatus: Healthy
        InstanceId: i-024583e16a4d10fed
        InstanceType: t2.nano
        LaunchConfigurationName: devops-init-instance-data
        LifecycleState: Pending
        ProtectedFromScaleIn: false
      - AvailabilityZone: ap-southeast-2b
        HealthStatus: Healthy
        InstanceId: i-0351f0612a7f185a8
        InstanceType: t2.nano
        LaunchConfigurationName: devops-init-instance-data
        LifecycleState: Pending
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
      VPCZoneIdentifier: subnet-0f82d6e49b9a6dafd,subnet-0299eb6eb289cef54
    ```

- Command used to get each asg instance hostname through the webserver

    ```bash
    # List the 
    $ aws ec2 describe-instances \
        --filters "Name=tag-value,Values=c03" \
        --query "Reservations[*].Instances[*].{Id:InstanceId,DnsName:PrivateDnsName,IpAddress:PublicIpAddress,State:State.Name,Zone:Placement.AvailabilityZone}" \
        --output table

    -----------------------------------------------------------------------------------------------------------------------------
    |                                                     DescribeInstances                                                     |
    +---------------------------------------------------+----------------------+-----------------+----------+-------------------+
    |                      DnsName                      |         Id           |    IpAddress    |  State   |       Zone        |
    +---------------------------------------------------+----------------------+-----------------+----------+-------------------+
    |  ip-172-16-11-58.ap-southeast-2.compute.internal  |  i-0351f0612a7f185a8 |  54.252.147.208 |  running |  ap-southeast-2b  |
    |  ip-172-16-10-150.ap-southeast-2.compute.internal |  i-024583e16a4d10fed |  13.239.98.213  |  running |  ap-southeast-2a  |
    +---------------------------------------------------+----------------------+-----------------+----------+-------------------+

    
    # now we can confirm the hostname 
    $ curl http://54.252.147.208
    ip-172-16-11-58.ap-southeast-2.compute.internal

    $ curl http://13.239.98.213
    ip-172-16-10-150.ap-southeast-2.compute.internal
    ```

- Details of the security group used on the asg

    ```bash
    $ aws ec2 describe-security-groups --group-id sg-047873ff7ad58face
    ```
    ```yaml
    SecurityGroups:
    - Description: Allow connection to port 80
      GroupId: sg-047873ff7ad58face
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
      - Key: DevopsClass
        Value: c03
      - Key: Name
        Value: c03-aws01-sg
      VpcId: vpc-027019faaf6756407
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