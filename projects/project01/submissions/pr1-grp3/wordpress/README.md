## Build and Push wordpress image to AWS ECR
### Create an ECR Repository
Login to the AWS console and navigate to 
ECR ->  Create repository -> Enable Tag Immutability -> Confirm creation
Repository name:ad/wordpress

### Push to AWS ECR 
#### Retrieve an authentication token and authenticate your Docker client to your registry
Use the AWS CLI:

```aws ecr get-login-password --region ap-southeast-2 | docker login --username AWS --password-stdin 607961847144.dkr.ecr.ap-southeast-2.amazonaws.com/ad/wordpress```


#### Build your Docker image using the following command. For information on building a Docker file from scratch see the instructions here . You can skip this step if your image is already built:

```docker build -t ad/wordpress .```

#### After the build completes, tag your image so you can push the image to this repository:
```docker tag wordpress:latest 607961847144.dkr.ecr.ap-southeast-2.amazonaws.com/ad/wordpress:latest```

#### Run the following command to push this image to your newly created AWS repository:
```docker push 607961847144.dkr.ecr.ap-southeast-2.amazonaws.com/ad/wordpress:latest```

