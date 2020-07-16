# C03-Docker04


## Command Execution Output
- Commands executed to clean up both the images and the containers(running or exited) from your local:
```
 LIST CONTAINER DETAILS
 > docker container ls
   CONTAINER ID        IMAGE               COMMAND              CREATED             STATUS              PORTS                  NAMES
   a1c08b6e0cdc        exercise02:v2       "httpd-foreground"   46 hours ago        Up 46 hours         0.0.0.0:8082->80/tcp   infallible_curran
   2776f5b8dfc2        exercise02:v1       "httpd-foreground"   46 hours ago        Up 46 hours         0.0.0.0:8081->80/tcp   fervent_darwin

 STOP THE RUNNING CONTAINERS
 > docker container stop a1c08b6e0cdc 2776f5b8dfc2
   a1c08b6e0cdc
   2776f5b8dfc2

 LIST IMAGE DETAILS
 > docker images
   REPOSITORY                    TAG                 IMAGE ID            CREATED             SIZE
   mail2kvanitha/devopsacademy   c03-docker03-e02    e0694673648f        46 hours ago        107MB
   exercise02                    v2                  e0694673648f        46 hours ago        107MB
   exercise02                    v1                  bda9d1507076        47 hours ago        107MB
   mail2kvanitha/devopsacademy   c03-docker03-e01    bda9d1507076        47 hours ago        107MB
   da-terraform                  c03-docker-e01      c50fc0cc7915        2 days ago          56MB
   mail2kvanitha/devopsacademy   c03-docker01        c50fc0cc7915        2 days ago          56MB

 REMOVE THE IMAGE LOCALLY
 > docker image rm exercise02:v2
   Untagged: exercise02:v2

 > docker image rm exercise02:v1
   Untagged: exercise02:v1

 > docker images
   REPOSITORY                    TAG                 IMAGE ID            CREATED             SIZE
   mail2kvanitha/devopsacademy   c03-docker03-e02    e0694673648f        46 hours ago        107MB
   mail2kvanitha/devopsacademy   c03-docker03-e01    bda9d1507076        47 hours ago        107MB
   mail2kvanitha/devopsacademy   c03-docker01        c50fc0cc7915        2 days ago          56MB
   da-terraform                  c03-docker-e01      c50fc0cc7915        2 days ago          56MB

 > docker image rm c50fc0cc7915
   Error response from daemon: conflict: unable to delete c50fc0cc7915 (must be forced) - image is referenced in multiple repositories
 > docker image rm -f c50fc0cc7915
   Untagged: da-terraform:c03-docker-e01
   Untagged: da-test:c03-docker01
   Untagged: mail2kvanitha/devopsacademy:c03-docker01
   Untagged: mail2kvanitha/devopsacademy@sha256:d4bce9eea652f401d303725e2fff96f419b24964b2f7a30cfb7034ea9e8f5be9
   Deleted: sha256:c50fc0cc7915ebf63c6f7130bef3485df61f8d1457db1c7e052d2272bd678d52
   Deleted: sha256:2acd9ac9216d866f063cabd1650321e973c30dceb37019e681e37bd6b27bbf72
   Deleted: sha256:83d870b8f4b4c1c1b26cdf9284a1b181c442a90a6b377c483ba91af32f6c052e

 > docker images
   REPOSITORY                    TAG                 IMAGE ID            CREATED             SIZE
   mail2kvanitha/devopsacademy   c03-docker03-e02    e0694673648f        47 hours ago        107MB
   mail2kvanitha/devopsacademy   c03-docker03-e01    bda9d1507076        2 days ago          107MB

 REMOVE the REPOSITORY TAGS CREATED FOR DOCKER HUB
 > docker image rm e0694673648f
   Error response from daemon: conflict: unable to delete e0694673648f (must be forced) - image is being used by stopped container a1c08b6e0cdc
 > docker image rm -f e0694673648f
   Untagged: mail2kvanitha/devopsacademy:c03-docker03-e02
   Untagged: mail2kvanitha/devopsacademy@sha256:03abf1864a5074f37aacac9ddd67f482e4126b94803455e7b4a73fe60920bcf3
   Deleted: sha256:e0694673648f729ab8213b2d81327fc180c47328f647fbe8e425824909c50d44
   Deleted: sha256:98395b1fe9711852b771d277c0962e44f2fe2efc5d20955624c7e63efac78b9d

 > docker image rm bda9d1507076
   Error response from daemon: conflict: unable to delete bda9d1507076 (must be forced) - image is being used by stopped container 2776f5b8dfc2
   Mon Jul 13 01:12:01 vanithak$ docker image rm -f bda9d1507076
   Untagged: mail2kvanitha/devopsacademy:c03-docker03-e01
   Untagged: mail2kvanitha/devopsacademy@sha256:49280b69871b86f2b58826a0bd152525261acde0f76f25286aba67e96cb2d099
   Deleted: sha256:bda9d1507076afc713affce35ed747c078503f8523fd4793b69a03379754581f
   Deleted: sha256:e6824bf7cb19dc17f51bc0b35a4252e3eae3458638f4d661bba109c6522f158f

 > docker images
   REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE

```

- Command and it's output showing that there is no image or container on your local. Use only TEXT for the command output, don't include images (JPEG, PNG, etc):
```
 CONFIRM CONTAINERS ARE STOPPED
 > docker container ls
   CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES

 > docker logs a1c08b6e0cdc
   AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.3. Set the 'ServerName' directive globally to suppress this message
   AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.3. Set the 'ServerName' directive globally to suppress this message
   [Fri Jul 10 16:12:32.456845 2020] [mpm_event:notice] [pid 1:tid 140640653413704] AH00489: Apache/2.4.41 (Unix) configured -- resuming normal operations
   [Fri Jul 10 16:12:32.456912 2020] [core:notice] [pid 1:tid 140640653413704] AH00094: Command line: 'httpd -D FOREGROUND'
   172.17.0.1 - - [10/Jul/2020:16:12:54 +0000] "GET / HTTP/1.1" 200 57
   172.17.0.1 - - [10/Jul/2020:16:20:22 +0000] "GET / HTTP/1.1" 200 131
   [Sun Jul 12 14:21:51.197008 2020] [mpm_event:notice] [pid 1:tid 140640653413704] AH00492: caught SIGWINCH, shutting down gracefully

 > docker logs 2776f5b8dfc2
   AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
   AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
   [Fri Jul 10 15:54:33.841865 2020] [mpm_event:notice] [pid 1:tid 140234695560520] AH00489: Apache/2.4.41 (Unix) configured -- resuming normal operations
   [Fri Jul 10 15:54:33.841944 2020] [core:notice] [pid 1:tid 140234695560520] AH00094: Command line: 'httpd -D FOREGROUND'
   172.17.0.1 - - [10/Jul/2020:15:54:51 +0000] "GET / HTTP/1.1" 200 57
   172.17.0.1 - - [10/Jul/2020:16:20:19 +0000] "GET / HTTP/1.1" 200 57
   [Sun Jul 12 14:21:51.197008 2020] [mpm_event:notice] [pid 1:tid 140234695560520] AH00492: caught SIGWINCH, shutting down gracefully

 > docker ps -a
   CONTAINER ID        IMAGE               COMMAND                   CREATED             STATUS                         PORTS                  NAMES
   52c2835c01f4        c50fc0cc7915        "terraform -v"            33 minutes ago      Exited (0) 33 minutes ago                             musing_varahamihira
   c4b9d5a7a1e4        c50fc0cc7915        "terraform -v"            36 minutes ago      Exited (0) 36 minutes ago                             jolly_lumiere
   e3553107e79d        c50fc0cc7915        "terraform -v"            38 minutes ago      Exited (0) 38 minutes ago                             jolly_lederberg
   a1c08b6e0cdc        e0694673648f        "httpd-foreground"        47 hours ago        Exited (0) About an hour ago                          infallible_curran
   2776f5b8dfc2        bda9d1507076        "httpd-foreground"        47 hours ago        Exited (0) About an hour ago                          fervent_darwin
 
 > docker container prune
   WARNING! This will remove all stopped containers.
   Are you sure you want to continue? [y/N] y
   Deleted Containers:
   52c2835c01f4473e1b5acd99caa5ec2bff65f8b1060a8547b89e341a0bfad5c1
   c4b9d5a7a1e41c240f3e0840b676c300913387d6a25ed0f0da4b899857a7574a
   e3553107e79d60b11863e54270ea83457166290d7784ba1c292f510d4bb269bf
   a1c08b6e0cdccadef2718ef3fd4c5cff1c3b21ebfa05cc9ccf180a7f6fb0246e
   2776f5b8dfc295f3a0c19490e50f91e10ca21260c5ec715b94d34224d9ccda7d
   
 > docker ps -a
   CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
 
 CONFIRM IMAGES ARE CLEANED
 > docker images
   REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker04](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker04/README.md)
