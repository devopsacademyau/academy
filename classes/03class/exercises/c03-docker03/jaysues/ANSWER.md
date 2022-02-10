# C03-Docker03

## Commands
- Commands executed to push both images to DockerHub as well as the output from those commands:
```
➜  jaysues git:(jaysues/c03-docker02) ✗ docker tag 9d535f213fb7 jaysuesdocker/c03e03:exercise02v1
➜  jaysues git:(jaysues/c03-docker02) ✗ docker push jaysuesdocker/c03e03:exercise02v1
The push refers to repository [docker.io/jaysuesdocker/c03e03]
3d1ebc5edfc2: Pushed
2e13702b9d23: Pushed
e3bc8d878156: Pushed
e5b0130c309b: Pushed
0675c21f3de0: Pushed
feaedf174d59: Pushed
07d3c46c9599: Pushed
exercise02v1: digest: sha256:cbfe3e2c1f81bde4d565cd27c9ce9539227380d66b642f75927e16c35e7ac6da size: 1779

➜  jaysues git:(jaysues/c03-docker02) ✗ docker tag 534839de86cc jaysuesdocker/c03e03:exercise02v2
➜  jaysues git:(jaysues/c03-docker02) ✗ docker push jaysuesdocker/c03e03:exercise02v2
The push refers to repository [docker.io/jaysuesdocker/c03e03]
700bdeaa2e2a: Pushed
2e13702b9d23: Layer already exists
e3bc8d878156: Layer already exists
e5b0130c309b: Layer already exists
0675c21f3de0: Layer already exists
feaedf174d59: Layer already exists
07d3c46c9599: Layer already exists
exercise02v2: digest: sha256:2938605aa85b15275344cbbcfb4d30484513ee1e3f9991dd41c91c68890c392e size: 1779

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)