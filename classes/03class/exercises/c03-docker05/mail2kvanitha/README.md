# C03-Docker05

## Command Execution Output
- Commands executed to run both containers:
```
 > docker run -d -p 8081:80 mail2kvanitha/devopsacademy:c03-docker03-e01
   Unable to find image 'mail2kvanitha/devopsacademy:c03-docker03-e01' locally
   c03-docker03-e01: Pulling from mail2kvanitha/devopsacademy
   aad63a933944: Already exists 
   29ade582b51e: Already exists 
   7e41ad5b6f9c: Already exists 
   ebf61b47b4ca: Already exists 
   9c060bce4eae: Already exists 
   56eea6f710f7: Already exists 
   Digest: sha256:49280b69871b86f2b58826a0bd152525261acde0f76f25286aba67e96cb2d099
   Status: Downloaded newer image for mail2kvanitha/devopsacademy:c03-docker03-e01
   c6ae446968b8abdbb984dba2b336db797fd5b917eef91ff0769b214e7a63112b

 > docker run -d -p 8082:80 -v ~/Downloads/DevopsAcademy/classes/03class/docker/artifacts/c03-docker02:/usr/local/apache2/htdocs mail2kvanitha/devopsacademy:c03-docker03-e02
   Unable to find image 'mail2kvanitha/devopsacademy:c03-docker03-e02' locally
   c03-docker03-e02: Pulling from mail2kvanitha/devopsacademy
   aad63a933944: Already exists 
   29ade582b51e: Already exists 
   7e41ad5b6f9c: Already exists 
   ebf61b47b4ca: Already exists 
   9c060bce4eae: Already exists 
   f06eafcc51e8: Already exists 
   Digest: sha256:03abf1864a5074f37aacac9ddd67f482e4126b94803455e7b4a73fe60920bcf3
   Status: Downloaded newer image for mail2kvanitha/devopsacademy:c03-docker03-e02
   f24f681081434ac1c72d3212617610e8aa4b83adb78639890148eff555e1b8ca

```

- A brief explanation of what happened when you executed the comands to run the containers:
```

 When the container run command is executed, at first the image is searched locally. If the image is not found locally, it will find the image from the Docker registry Hub. 
 If the image is found in the Docker Hub, it will pull the image locally first. Then it will run the container from this local image.

 Another way to do this is to pull the image manually using cli ("docker pull" command) to pull the image from Docker hub to local. This way,the containers are built using the local images that was downloaded previously.

```

- Command to list all images on your local as well as its output:
```

 > docker images -a
   REPOSITORY                    TAG                 IMAGE ID            CREATED             SIZE
   mail2kvanitha/devopsacademy   c03-docker03-e02    e0694673648f        2 days ago          107MB
   mail2kvanitha/devopsacademy   c03-docker03-e01    bda9d1507076        2 days ago          107MB

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)
