# C03-Docker03

## Commands
- Commands executed to push both images to DockerHub as well as the output from those commands:
```
The push refers to repository [docker.io/marshalldaniel/exercise02]
76fc9437e1fd: Pushed 
da8b1af5d0b7: Pushed 
93203cf3884d: Mounted from library/httpd 
4d98b137a090: Pushed 
e77842cc6cf9: Pushed 
294ac687b5fc: Mounted from library/httpd 
v1: digest: sha256:8d1594e0ae813a395bba2302293f309ce71f69545967a673cd1b6bc5412b603b size: 1569

docker tag exercise02:v2 marshalldaniel/exercise02:v2
docker push marshalldaniel/exercise02:v2

The push refers to repository [docker.io/marshalldaniel/exercise02]
74d5b265d6b6: Pushed 
da8b1af5d0b7: Layer already exists 
93203cf3884d: Layer already exists 
4d98b137a090: Layer already exists 
e77842cc6cf9: Layer already exists 
294ac687b5fc: Layer already exists 
v2: digest: sha256:18b3179e2d84ad2ac0c7068c53291e8dccddc06a5d62a683a15f20a67c974b60 size: 1569

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)
