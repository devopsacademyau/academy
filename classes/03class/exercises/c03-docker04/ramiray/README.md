
- Commands executed to clean up both the images and the containers(running or exited) from your local:
```
# Listing all the images:

$ docker ps -a
CONTAINER ID        IMAGE                         COMMAND                  CREATED             STATUS                    PORTS                  NAMES
e1546a000d7e        exercise02:v2                 "httpd-foreground"       About an hour ago   Up About an hour          0.0.0.0:8082->80/tcp   devtest
5380b6372f97        a0a67f4086a5                  "httpd-foreground"       2 hours ago         Created                                          exercisecon-v2
d2b3cd670fe2        exercise02:v1                 "httpd-foreground"       19 hours ago        Up 19 hours               0.0.0.0:8081->80/tcp   pensive_cray
eca974d2eda0        ramirayhtml:v1                "httpd-foreground"       21 hours ago        Created                                          admiring_clarke
6f3d05ca000f        ramirayhtml:v1                "httpd-foreground"       23 hours ago        Up 23 hours               0.0.0.0:8080->80/tcp   distracted_yonath
74d025e05d1f        da-terraform:c03-docker-e01   "terraform -v"           25 hours ago        Exited (0) 25 hours ago                          happy_shaw
87e9c6b3a7fc        ramiray:latest                "cat /etc/os-release"    25 hours ago        Exited (0) 25 hours ago                          hardcore_margulis
d0bb07a82724        hello-world:latest            "bash"                   26 hours ago        Created                                          gallant_feynman
0fed5cd1cda5        hello-world:latest            "/hello"                 26 hours ago        Exited (0) 26 hours ago                          infallible_easley
851b7c5b117d        hello-world:latest            "/bin/bash"              26 hours ago        Created                                          jolly_archimedes
5a661dfebbab        hello-world                   "/bin/bash"              26 hours ago        Created                                          amazing_chebyshev
25dde040c892        ramiray_www                   "docker-php-entrypoi…"   2 days ago          Exited (0) 2 days ago                            ramiray_www_1
68913ae1f537        mysql:5.7                     "docker-entrypoint.s…"   2 days ago          Exited (0) 2 days ago                            ramiray_db_1
a80a3bc991f8        hello-world                   "/hello"                 2 days ago          Exited (0) 2 days ago                            gracious_mclean
46873fbe9016        hello-world                   "/hello"                 2 days ago          Exited (0) 2 days ago                            naughty_edison
06e6ad75cd62        hello-world                   "/hello"                 2 days ago          Exited (0) 2 days ago                            priceless_borg

# Stop and remove the containers prior removing the images 

$ docker stop $(docker ps -a -q)
e1546a000d7e
5380b6372f97
d2b3cd670fe2
eca974d2eda0
6f3d05ca000f
74d025e05d1f
87e9c6b3a7fc
0fed5cd1cda5
851b7c5b117d
5a661dfebbab
25dde040c892
68913ae1f537
a80a3bc991f8
46873fbe9016
06e6ad75cd62

$ docker rm $(docker ps -a -q)     
e1546a000d7e
5380b6372f97
d2b3cd670fe2
eca974d2eda0
6f3d05ca000f
74d025e05d1f
d0bb07a82724
0fed5cd1cda5
851b7c5b117d
5a661dfebbab
25dde040c892
68913ae1f537
a80a3bc991f8
46873fbe9016
06e6ad75cd62

# Removing all the images: 

$ docker rmi -f $(docker images -a -q)
Untagged: exercise02:v2
Untagged: ramiray/dockerexe:exercise02v2
Untagged: ramiray/dockerexe@sha256:41c9b030d98c01efc465b97b094ff7924eabd36325dc8a7cc9388347cc8a213b
Deleted: sha256:e19f591b256dbbd6f19519c88e3281f86f6544391853638ea3553a20319bea79
Deleted: sha256:3ae40990d292533fadc5b038ed019b4bdcdeea306b7cc7a96699d512c492bb8d
Deleted: sha256:7ea9b130522fa469a49f9fff2bf32d69e83f0b05547ece875acfe12c8db663db
Untagged: exercise02:v1
Untagged: ramiray/dockerexe:exercise02v1
Untagged: ramiray/dockerexe@sha256:3416d3615aa399d056096cfc30f08e6e36f9224703cfd0e195405a397fd7203c
Deleted: sha256:aaf6890d1de530ee4952f6acbde480c98b30b922fa5265d3a2936a707d7bc560
Deleted: sha256:e51670092e6ea9cb6ac07e72ac4d786588bfa1806b8d46df458426495bb7b2e9
Deleted: sha256:1cce890cd43df34beeaba24b0c75755c28bb7607c971c4a469234d8769ec28af
Untagged: httpd:2.4.41-alpine
Untagged: httpd@sha256:06ad90574c3a152ca91ba9417bb7a8f8b5757b44d232be12037d877e9f8f68ed
Deleted: sha256:54b0995a630527d5e8db6dfee1fedace23d145d7b916a455e0c8380db974d81c
Deleted: sha256:7cc2d2925b2b34f2dd686affc440499fa783c4ab357be56c5c49344dbd40d5ce
Deleted: sha256:72a14eca8a5cfa546ea7c391135969bf4a05ffa19518ff4441f66cadcc906fd9
Deleted: sha256:09427ece5b0c3fb84f7f65b61418e9a0cf31671722149b3d4688d29a61f8c0e4
Deleted: sha256:606838becbce6cc233c0d188ba9c137e32692aa75cedf12fda078512dfc8845c
Deleted: sha256:beee9f30bc1f711043e78d4a2be0668955d4b761d587d6f60c2c8dc081efb203
Error: No such image: e19f591b256d
Error: No such image: 3ae40990d292
Error: No such image: aaf6890d1de5
Error: No such image: e51670092e6e

```

- Command and it's output showing that there is no image or container on your local. Use only TEXT for the command output, don't include images (JPEG, PNG, etc):
```
$ docker ps -all
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES

$ docker images -a
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker04](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker04/README.md)