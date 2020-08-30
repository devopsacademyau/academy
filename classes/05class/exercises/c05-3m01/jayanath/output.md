```
jayanath git:(jayanath/c05-3m01) ✗ make create_bucket

```
Output is trimmed.
```
  creating: aws/dist/awscli/customizations/wizard/wizards/lambda/
  inflating: aws/dist/awscli/customizations/wizard/wizards/configure/_main.yml
  inflating: aws/dist/awscli/customizations/wizard/wizards/lambda/new-function.yml
  inflating: aws/dist/awscli/customizations/wizard/wizards/dynamodb/new-table.yml
  inflating: aws/dist/awscli/customizations/wizard/wizards/iam/new-role.yml
   creating: aws/dist/zlib/cpython-37m-x86_64-linux-gnu/
  inflating: aws/dist/zlib/cpython-37m-x86_64-linux-gnu/soib.cpython-37m-x86_64-linux-gnu.so
You can now run: /usr/local/bin/aws --version
Removing intermediate container 2c47b136c017
 ---> 0e3b98018543
Step 3/3 : CMD [ "bash" ]
 ---> Running in 672031624e65
Removing intermediate container 672031624e65
 ---> c674670749e7

Successfully built c674670749e7
Successfully tagged jayanath_3m_run:latest
WARNING: Image for service 3m_run was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.
bash scripts/create_bucket.sh
make_bucket: bucket.me.not.20200823
➜  jayanath git:(jayanath/c05-3m01)

```

```
➜  jayanath git:(jayanath/c05-3m01) ✗ make delete_bucket
```

```
docker-compose run --rm 3m_run make _delete_bucket
bash scripts/delete_bucket.sh
remove_bucket: bucket.me.not.20200823
```
