# C03-Docker04


## Command Execution Output
- Commands executed to clean up both the images and the containers(running or exited) from your local:
```
conor.chisholm-ray@contino.io@Conors-MacBook-Pro academy % docker ps                            
CONTAINER ID   IMAGE           COMMAND              CREATED          STATUS          PORTS                  NAMES
d0b676b749a7   exercise02:v2   "httpd-foreground"   46 minutes ago   Up 46 minutes   0.0.0.0:8082->80/tcp   dazzling_tu
8c93a85d7587   exercise02:v1   "httpd-foreground"   53 minutes ago   Up 53 minutes   0.0.0.0:8081->80/tcp   frosty_elgamal
conor.chisholm-ray@contino.io@Conors-MacBook-Pro academy % docker stop d0b676b749a7
d0b676b749a7
conor.chisholm-ray@contino.io@Conors-MacBook-Pro academy % docker stop 8c93a85d7587
8c93a85d7587
conor.chisholm-ray@contino.io@Conors-MacBook-Pro academy % docker image ls   
REPOSITORY              TAG              IMAGE ID       CREATED             SIZE
conorcr/devopsacademy   v2               6f6e8f012fe1   About an hour ago   57MB
conorcr/exercise02      v2               6f6e8f012fe1   About an hour ago   57MB
exercise02              v2               6f6e8f012fe1   About an hour ago   57MB
conorcr/devopsacademy   v1               8bada15d8d8d   About an hour ago   57MB
conorcr/exercise02      v1               8bada15d8d8d   About an hour ago   57MB
exercise02              v1               8bada15d8d8d   About an hour ago   57MB
<none>                  <none>           37764f9fad4e   3 hours ago         55.8MB
<none>                  <none>           7bf411e919ae   3 hours ago         55.8MB
<none>                  <none>           59fb75ca2555   3 hours ago         55.8MB
da-terraform            c03-docker-e01   39aa55e96f68   3 hours ago         55.8MB
conor.chisholm-ray@contino.io@Conors-MacBook-Pro academy % docker image rm -f 6f6e8f012fe1
Untagged: conorcr/devopsacademy:v2
Untagged: conorcr/exercise02:v2
Untagged: conorcr/exercise02@sha256:c8873cca97ecaa7a0f21ae0a53c6e362fdbd92700319c994e3e3e8988a972b3c
Untagged: exercise02:v2
Deleted: sha256:6f6e8f012fe1035d3a391772a329c8fb94699a8192927636a0757680a8fb2599
conor.chisholm-ray@contino.io@Conors-MacBook-Pro academy % docker image rm -f 8bada15d8d8d
Untagged: conorcr/devopsacademy:v1
Untagged: conorcr/exercise02:v1
Untagged: conorcr/exercise02@sha256:7108518c63ea11426592a171a25afc2379712ce873ba5ba203479eb72a1411ee
Untagged: exercise02:v1
Deleted: sha256:8bada15d8d8d83010fe6a8bf69d5836e22daec1294029a89018c3717c49ce0f1

```

- Command and it's output showing that there is no image or container on your local. Use only TEXT for the command output, don't include images (JPEG, PNG, etc):
```
conor.chisholm-ray@contino.io@Conors-MacBook-Pro academy % docker image ls                
REPOSITORY     TAG              IMAGE ID       CREATED       SIZE
<none>         <none>           37764f9fad4e   3 hours ago   55.8MB
<none>         <none>           7bf411e919ae   3 hours ago   55.8MB
<none>         <none>           59fb75ca2555   3 hours ago   55.8MB
da-terraform   c03-docker-e01   39aa55e96f68   3 hours ago   55.8MB
```


***
Answer for exercise [c03-docker04](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker04/README.md)