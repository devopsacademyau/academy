```
> vanithak@~/3m$make create_bucket
  ...
  inflating: aws/dist/awscli/data/metadata.json  
  inflating: aws/dist/awscli/data/ac.index  
   creating: aws/dist/awscli/customizations/wizard/
   creating: aws/dist/awscli/customizations/wizard/wizards/
   creating: aws/dist/awscli/customizations/wizard/wizards/configure/
   creating: aws/dist/awscli/customizations/wizard/wizards/dynamodb/
   creating: aws/dist/awscli/customizations/wizard/wizards/iam/
   creating: aws/dist/awscli/customizations/wizard/wizards/lambda/
  inflating: aws/dist/awscli/customizations/wizard/wizards/configure/_main.yml  
  inflating: aws/dist/awscli/customizations/wizard/wizards/lambda/new-function.yml  
  inflating: aws/dist/awscli/customizations/wizard/wizards/dynamodb/new-table.yml  
  inflating: aws/dist/awscli/customizations/wizard/wizards/iam/new-role.yml  
   creating: aws/dist/zlib/cpython-37m-x86_64-linux-gnu/
  inflating: aws/dist/zlib/cpython-37m-x86_64-linux-gnu/soib.cpython-37m-x86_64-linux-gnu.so  
 You can now run: /usr/local/bin/aws --version
 Removing intermediate container d23f70dc6a45
  ---> cd1bd84113ae
 Step 3/3 : CMD [ "bash" ]
  ---> Running in 9b339461720e
 Removing intermediate container 9b339461720e
  ---> b9443a5376ec
 
 Successfully built b9443a5376ec
 Successfully tagged 3m_3mdemo:latest
 WARNING: Image for service 3mdemo was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.
 make_bucket: mail2kvanitha
```
```
> vanithak@~/3m$ make list_bucket
 docker-compose run --rm 3mdemo aws s3 ls
 2020-08-24 15:32:17 mail2kvanitha
 2020-08-18 05:13:21 webdevacademy
```
```
 > vanithak@~/3m$ make delete_bucket
 docker-compose run --rm 3mdemo sh ./scripts/delete_bucket.sh
 remove_bucket: mail2kvanitha

 > vanithak@~/3m$ make list_bucket
 docker-compose run --rm 3mdemo aws s3 ls
 2020-08-18 05:13:21 webdevacademy
 ```
 ```
 > vanithak@~/3m$ make check_container
 docker-compose run --rm 3mdemo pwd && echo "Hello" > test.txt && ls -l
 /3m-demo
 total 32
 -rw-r--r--  1 vanithak  staff  288 24 Aug 20:45 Dockerfile
 -rw-r--r--  1 vanithak  staff  791 25 Aug 01:31 Makefile
 -rw-r--r--  1 vanithak  staff  170 24 Aug 23:20 docker-compose.yaml
 drwxr-xr-x  6 vanithak  staff  192 25 Aug 01:23 scripts
 -rw-r--r--  1 vanithak  staff    6 25 Aug 01:32 test.txt
 ```
 ```
 > vanithak@~/3m$ make check_docker
 Docker Images
 =============
 REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
 3m_3mdemo           latest              b9443a5376ec        44 seconds ago      349MB
 <none>              <none>              cd1bd84113ae        45 seconds ago      349MB
 ubuntu              18.04               6526a1858e5d        4 days ago          64.2MB
 
 Docker Containers Running
 =========================
 CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
 vanithak@~/3m$ make clean_docker
 Removing network 3m_default
 Total reclaimed space: 0B
 Untagged: 3m_3mdemo:latest
 Deleted: sha256:b9443a5376ec0ada70de0a3bfdd12e9e93ad716e0754a599da2fc5a8c3ad90fd
 Deleted: sha256:cd1bd84113ae7b2ca2dd84e4f305a39d37999c15fb72310fc6188fa65e6f1896
 Deleted: sha256:4d03d552b13d607b0ceb8e181a63f839584a8dd5d2441e3cd896c81a55a998e7
 Untagged: ubuntu:18.04
 Untagged: ubuntu@sha256:05a58ded9a2c792598e8f4aa8ffe300318eac6f294bf4f49a7abae7544918592
 Deleted: sha256:6526a1858e5d72cdffdcb41874f5f7ab3e7d531836a45bb144bf650b7242ce20
 Deleted: sha256:386325b12f0574c516846ca10e9c4cc9fb08c012ba2e571c783d0c74b88ca0ed
 Deleted: sha256:f86ba01a62c1708987f3b2e4ffaacd32248706943070ce2caa6758a14bdcb6e4
 Deleted: sha256:7c0ecf8a144d3f703314f27d10f5913d96da01a939fdfb490463164abd2d69d1
 Deleted: sha256:79bde4d54386664324ce9b6179a3265ca96e6c8f05c06ded53856a670874c715
 Error: No such image: cd1bd84113ae
 make: [clean_docker] Error 1 (ignored)
 REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
 
 
 CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```
