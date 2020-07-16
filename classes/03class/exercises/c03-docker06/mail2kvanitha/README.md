# C03-Docker06

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Commands used to build  the image:
```
 > docker build -t hello_name:v1 -f Dockerfile1 .
   Step 1/2 : FROM alpine:latest
    ---> a24bb4013296
   Step 2/2 : ENTRYPOINT ["echo","Hello"]
    ---> Running in c2f49d69ecd9
   Removing intermediate container c2f49d69ecd9
    ---> 4646a4622565
   Successfully built 4646a4622565
   Successfully tagged hello_name:v1

```

- Commands used to execute the image and the output of container execution:
```

 > docker run hello_name:v1 mail2kvanitha
   Hello mail2kvanitha

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker06](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker06/README.md)
