# C03-MAKE01

## Make
- [Dockerfile](Dockerfile)
- [Makefile](Makefile)

## Command Execution Output

- Execution and output of the command `make build`
```
ravi.senevirathne@contino.io@Ravis-MacBook-Pro ravisenevirathne % make build
Building the container based on 9602ffa
docker build -t "make01:9602ffa" -f Dockerfile .
[+] Building 1.4s (7/7) FINISHED                                                                                                                                                                                
 => [internal] load build definition from Dockerfile                                                                                                                                                     
 => => transferring dockerfile: 36B                                                                                                                                                                
 => [internal] load .dockerignore                                                                                                                                                                        
 => => transferring context: 2B                                                                                                                                                                        
 => [internal] load metadata for docker.io/library/httpd:2.4.41-alpine                                          
 => [internal] load build context                                                                                                     
 => => transferring context: 103B                                                                 
 => CACHED [1/2] FROM docker.io/library/httpd:2.4.41-alpine@sha256:06ad90574c3a152ca91ba9417bb7a8f8b5757b44d232be12037d877e9f8f68ed           
 => [2/2] ADD ./index.html /usr/local/apache2/htdocs 
 => exporting to image                                                                                          
 => => exporting layers                                                                                          
 => => writing image sha256:a796d68a3ca7f2351cbdf1e857f8fb52311bf79601749e8acef7c4d038353df6    
 => => naming to docker.io/library/make01:9602ffa 
```

- Execution and output of the command `make push`
```
ravi.senevirathne@contino.io@Ravis-MacBook-Pro ravisenevirathne % make push
Pushing container to docker hub
docker tag "make01:9602ffa" "ravisenevirathne"/"make01:9602ffa"
docker push "ravisenevirathne"/"make01:9602ffa"
The push refers to repository [docker.io/ravisenevirathne/make01]
24db20cf702d: Pushed 
da8b1af5d0b7: Mounted from ravisenevirathne/c03-docker03 
93203cf3884d: Mounted from ravisenevirathne/c03-docker03 
4d98b137a090: Mounted from ravisenevirathne/c03-docker03 
e77842cc6cf9: Mounted from ravisenevirathne/c03-docker03 
294ac687b5fc: Mounted from ravisenevirathne/c03-docker03 
9602ffa: digest: sha256:332b0b4a8253b64ca773b1a67c3ee7a501f2f370901e935648384f11af60a426 size: 1569
```

- Execution and output of the command `make run`
```
ravi.senevirathne@contino.io@Ravis-MacBook-Pro ravisenevirathne % make run PORT=8010
echo "Running container"
Running container
docker run -d -p 8010:80 "make01:9602ffa"
63bb150608f8fe3ca020d0b1a41c3976f3a552f702244079def7c0c1ab44ce5e
echo "Checking with Curl"
Checking with Curl
curl http://localhost:8010
This image was created by Ravi Senevirathne, based on the 9602ffa
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-make01](https://github.com/devopsacademyau/academy/blob/8b64a93a228398e7342afe7b845cd197b22afaf3/classes/03class/exercises/c03-make01/README.md)