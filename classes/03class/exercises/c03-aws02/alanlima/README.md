# c03-aws02

## Command Execution Output

- Command used to create the Application Load Balancer (ALB)

    * **Create Load Balancer**
    
    ```bash
    $ aws elbv2 create-load-balancer \
        --name devopsacademy-lb \
        --scheme internet-facing \
        --subnets subnet-0f82d6e49b9a6dafd subnet-0299eb6eb289cef54 \
        --security-groups sg-098dda5e94f8a3855 \
        --tags Key=DevopsClass,Value=c03 \
        --type application \
        --ip-address-type ipv4
    ```

    ```yaml
    LoadBalancers:
        - AvailabilityZones:
        - LoadBalancerAddresses: []
            SubnetId: subnet-0299eb6eb289cef54
            ZoneName: ap-southeast-2b
        - LoadBalancerAddresses: []
            SubnetId: subnet-0f82d6e49b9a6dafd
            ZoneName: ap-southeast-2a
        CanonicalHostedZoneId: Z1GM3OXH4ZPM65
        CreatedTime: '2020-07-09T06:06:10.500000+00:00'
        DNSName: devopsacademy-lb-1691285263.ap-southeast-2.elb.amazonaws.com
        IpAddressType: ipv4
        LoadBalancerArn: arn:aws:elasticloadbalancing:ap-southeast-2:097922957316:loadbalancer/app/devopsacademy-lb/8514943c4cd7b139
        LoadBalancerName: devopsacademy-lb
        Scheme: internet-facing
        SecurityGroups:
        - sg-098dda5e94f8a3855
        State:
            Code: provisioning
        Type: application
    ```
    
    * **Create Target Group**
    
    ```bash
    $ aws elbv2 create-target-group \
        --name devopsacademy-lb-tg \
        --protocol HTTP \
        --port 80 \
        --target-type instance \
        --vpc-id vpc-027019faaf6756407
    ```
    
    ```yaml
    TargetGroups:
    - HealthCheckEnabled: true
      HealthCheckIntervalSeconds: 30
      HealthCheckPath: /
      HealthCheckPort: traffic-port
      HealthCheckProtocol: HTTP
      HealthCheckTimeoutSeconds: 5
      HealthyThresholdCount: 5
      LoadBalancerArns:
      - arn:aws:elasticloadbalancing:ap-southeast-2:097922957316:loadbalancer/app/devopsacademy-lb/8514943c4cd7b139
      Matcher:
        HttpCode: '200'
      Port: 80
      Protocol: HTTP
      TargetGroupArn: arn:aws:elasticloadbalancing:ap-southeast-2:097922957316:targetgroup/devopsacademy-lb-tg/f53590c0090c6267
      TargetGroupName: devopsacademy-lb-tg
      TargetType: instance
      UnhealthyThresholdCount: 2
      VpcId: vpc-027019faaf6756407
    ```
    
    * **Register Targets / Create Listener** 
    
    ```bash
    $ aws elbv2 register-targets \
        --target-group-arn arn:aws:elasticloadbalancing:ap-southeast-2:097922957316:targetgroup/devopsacademy-lb-tg/f53590c0090c6267 \
        --targets Id=i-061d30accff45a119 Id=i-04be230f0c0cd2fb2

    $ aws elbv2 create-listener \
        --load-balancer-arn arn:aws:elasticloadbalancing:ap-southeast-2:097922957316:loadbalancer/app/devopsacademy-lb/8514943c4cd7b139 \
        --protocol HTTP --port 80 \
        --default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:ap-southeast-2:097922957316:targetgroup/devopsacademy-lb-tg/f53590c0090c6267
    ```

    ```yaml
    Listeners:
    - DefaultActions:
      - ForwardConfig:
          TargetGroupStickinessConfig:
            Enabled: false
          TargetGroups:
          - TargetGroupArn: arn:aws:elasticloadbalancing:ap-southeast-2:097922957316:targetgroup/devopsacademy-lb-tg/f53590c0090c6267
            Weight: 1
        TargetGroupArn: arn:aws:elasticloadbalancing:ap-southeast-2:097922957316:targetgroup/devopsacademy-lb-tg/f53590c0090c6267
        Type: forward
      ListenerArn: arn:aws:elasticloadbalancing:ap-southeast-2:097922957316:listener/app/devopsacademy-lb/8514943c4cd7b139/1d221dea58aab106
      LoadBalancerArn: arn:aws:elasticloadbalancing:ap-southeast-2:097922957316:loadbalancer/app/devopsacademy-lb/8514943c4cd7b139
      Port: 80
      Protocol: HTTP
    ```

    * **Check Targets Health**
    
    ```bash
    $ aws elbv2 describe-target-health \
        --target-group-arn arn:aws:elasticloadbalancing:ap-southeast-2:097922957316:targetgroup/devopsacademy-lb-tg/f53590c0090c6267
    ```
    
    ```yaml
    TargetHealthDescriptions:
    - HealthCheckPort: '80'
      Target:
        Id: i-04be230f0c0cd2fb2
        Port: 80
      TargetHealth:
        State: healthy
    - HealthCheckPort: '80'
      Target:
        Id: i-061d30accff45a119
        Port: 80
      TargetHealth:
        State: healthy
    ```

- Details of the security group used

    ```bash
    $ aws ec2 describe-security-groups --group-id sg-098dda5e94f8a3855
    ```
    
    ```yaml
    SecurityGroups:
    - Description: Allow connection to port 80
      GroupId: sg-098dda5e94f8a3855
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
      VpcId: vpc-027019faaf6756407
    ```

## Questions:

- Run a few times `curl <load-balancer-cname>` and explain what do you see?

    ```text
    The instance metadata of the running instances is returned randomly.
    The Load Balancer distributes the request between running instances so for each request;
    we will see different metadata depending on which instance the Load Balancer selected.
    ```
    
    `curl` Output:
    
    ```bash
    D://source on ☁️  ap-southeast-2 at [16:37]
    ⚡ curl devopsacademy-lb-1691285263.ap-southeast-2.elb.amazonaws.com
    ip-172-16-10-252.ap-southeast-2.compute.internal
    
    D://source on ☁️  ap-southeast-2 at [16:37]
    ⚡ curl devopsacademy-lb-1691285263.ap-southeast-2.elb.amazonaws.com
    ip-172-16-10-138.ap-southeast-2.compute.internal
    
    D://source on ☁️  ap-southeast-2 at [16:37]
    ⚡ curl devopsacademy-lb-1691285263.ap-southeast-2.elb.amazonaws.com
    ip-172-16-10-138.ap-southeast-2.compute.internal
    
    D://source on ☁️  ap-southeast-2 at [16:37]
    ⚡ curl devopsacademy-lb-1691285263.ap-southeast-2.elb.amazonaws.com
    ip-172-16-10-252.ap-southeast-2.compute.internal
    ```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws02](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws02/README.md)