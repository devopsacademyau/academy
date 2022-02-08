# C03-Docker03

## Commands
- Commands executed to push both images to DockerHub as well as the output from those commands:
```
conor.chisholm-ray@contino.io@Conors-MacBook-Pro academy % docker image tag exercise02:v1 conorcr/exercise02:v1  
conor.chisholm-ray@contino.io@Conors-MacBook-Pro academy % docker image push conorcr/exercise02:v1
The push refers to repository [docker.io/conorcr/exercise02]
e6bdc71d3adf: Pushed 
2e13702b9d23: Mounted from library/httpd 
e3bc8d878156: Mounted from library/httpd 
e5b0130c309b: Mounted from library/httpd 
0675c21f3de0: Mounted from library/httpd 
feaedf174d59: Mounted from library/httpd 
07d3c46c9599: Mounted from library/httpd 
v1: digest: sha256:7108518c63ea11426592a171a25afc2379712ce873ba5ba203479eb72a1411ee size: 1779
conor.chisholm-ray@contino.io@Conors-MacBook-Pro academy % docker image tag exercise02:v2 conorcr/exercise02:v2
conor.chisholm-ray@contino.io@Conors-MacBook-Pro academy % docker image push conorcr/exercise02:v2             
The push refers to repository [docker.io/conorcr/exercise02]
af4090211890: Pushed 
2e13702b9d23: Layer already exists 
e3bc8d878156: Layer already exists 
e5b0130c309b: Layer already exists 
0675c21f3de0: Layer already exists 
feaedf174d59: Layer already exists 
07d3c46c9599: Layer already exists 
v2: digest: sha256:c8873cca97ecaa7a0f21ae0a53c6e362fdbd92700319c994e3e3e8988a972b3c size: 1779

```


***
Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)