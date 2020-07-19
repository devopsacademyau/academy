
# C03-Docker02

## Docker 
- [Dockerfile.v1](Dockerfile.v1)
- [Dockerfile.v2](Dockerfile.v2)

## Command Execution Output
- Curl command and its output of before changing the image:
```
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
```

- Curl command and its output of after changing the image:
```
<h1>Daniel local htm</h1>
```

- Explain any difference between the responses of the webservers before and after changing the file locally:
```
I can change my local file in v2 and it will be reflected in the browser
```
Outputs

```
❯ docker build -t exercise02:v1 -f Dockerfile.v1 .  
Sending build context to Docker daemon 4.096kB  
Step 1/2 : FROM httpd:2.4.41-alpine  
---> 54b0995a6305  
Step 2/2 : COPY index.html /usr/local/apache2/htdocs/  
---> 5cb648d04901  
Successfully built 5cb648d04901  
Successfully tagged exercise02:v1  

❯ docker run -d -p 8087:80 exercise02:v1  
cab514e0f15b99f78328e3404ff68c86773406593904762674600e7a65ef57e2

docker build -t exercise02:v2 -f Dockerfile.v2 .

docker run -p 8089:80 -d -v /mnt/e/DevOpsAcademy/academy/classes/03class/exercies/c03-docker02/danielvca:/usr/local/apache2/htdocs exercise02:v2
```


<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker02](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker02/README.md)

> Written with [StackEdit](https://stackedit.io/).
