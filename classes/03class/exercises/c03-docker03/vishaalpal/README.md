# C03-Docker03

## Commands
- Commands executed to push both images to DockerHub as well as the output from those commands:
```
# Logging into my docker account
cat dockercreds.txt | docker login --username vee94 --password-stdin
Login Succeeded

# Tagging my existing docker images to push them to the repo
docker tag exercise02:v1  vee94/vishaalpal-docker-images:exercise02-v1
docker tag exercise02:v2  vee94/vishaalpal-docker-images:exercise02-v2

# Reviewing the list of current docker images
docker images
REPOSITORY                       TAG              IMAGE ID       CREATED        SIZE
exercise02                       v1               032a24cc4e91   4 hours ago    107MB
vee94/vishaalpal-docker-images   c03-docker03v1   032a24cc4e91   4 hours ago    107MB
vee94/vishaalpal-docker-images   exercise02-v1    032a24cc4e91   4 hours ago    107MB
exercise02                       v2               f440a14fb8bb   5 hours ago    107MB
vee94/vishaalpal-docker-images   exercise02-v2    f440a14fb8bb   5 hours ago    107MB
da-terraform                     c03-docker-e01   9cc202645609   20 hours ago   60.4MB
docker/getting-started           latest           720f449e5af2   2 months ago   27.2MB

# Pushing the image for Dockerfile.v1 from the previous exercise
docker push vee94/vishaalpal-docker-images:exercise02-v1
The push refers to repository [docker.io/vee94/vishaalpal-docker-images]
0459479832e3: Pushed 
da8b1af5d0b7: Mounted from library/httpd 
93203cf3884d: Mounted from library/httpd 
4d98b137a090: Mounted from library/httpd 
e77842cc6cf9: Mounted from library/httpd 
294ac687b5fc: Mounted from library/httpd 
exercise02-v1: digest: sha256:4180ad335134046b53f4112196fd49469a0821455c1c44d7cee468ccda5902ef size: 1569

# Pushing the image for Dockerfile.v2 from the previous exercise
docker push vee94/vishaalpal-docker-images:exercise02-v2
The push refers to repository [docker.io/vee94/vishaalpal-docker-images]
685ddeee5704: Pushed 
da8b1af5d0b7: Layer already exists 
93203cf3884d: Layer already exists 
4d98b137a090: Layer already exists 
e77842cc6cf9: Layer already exists 
294ac687b5fc: Layer already exists 
exercise02-v2: digest: sha256:75274661e45e0faa9d735ec1e25f3ee0412e8ca83614db455592235d6676cbf5 size: 1569
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)

