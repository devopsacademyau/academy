# C03-Docker03

## Commands
- Commands executed to push both images to DockerHub as well as the output from those commands:
```
$  docker tag 0c52ba6ac9bd beardedsamwise/c03-docker03:v1
$  docker push beardedsamwise/c03-docker03:v1
The push refers to repository [docker.io/beardedsamwise/c03-docker03]
5fd913d48afc: Pushed
da8b1af5d0b7: Mounted from library/httpd
93203cf3884d: Mounted from library/httpd
4d98b137a090: Mounted from library/httpd
e77842cc6cf9: Mounted from library/httpd
294ac687b5fc: Mounted from library/httpd
v1: digest: sha256:d2583b9c3098108fa7894317f9ddbb421220aed72fbb685c00e1e1d746e8c72f size: 1569
$ docker tag 7dbad1c627a4 beardedsamwise/c03-docker03:v2
$ docker push beardedsamwise/c03-docker03:v2
The push refers to repository [docker.io/beardedsamwise/c03-docker03]
155fed71030d: Pushed
da8b1af5d0b7: Layer already exists
93203cf3884d: Layer already exists
4d98b137a090: Layer already exists
e77842cc6cf9: Layer already exists
294ac687b5fc: Layer already exists
v2: digest: sha256:2eea74ac41d2cae23b8808273a71e44635c3dcffaa6efbc66c49df065305f170 size: 1569
 ~
```

***
Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)