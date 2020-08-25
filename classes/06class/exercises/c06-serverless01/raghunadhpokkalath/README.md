# c06-serverless01

## Creating a POST API using API Gateway, Lambda and DynamoDB

- [Makefile](Makefile)
- [.env](.env)
- [output.md](output.md)
- [docker-compose.yml](docker-compose.yml)
- [dockerfile](docker/Dockerfile.ubuntu)
- [_provider.tf](terraform/_provider.tf)
- [main.tf](terraform/main.tf)
- [iam.tf](terraform/iam.tf)
- [apigw.tf](terraform/apigw.tf)
- [lambda_da.zip](terraform/lambda_da.zip)
- [output.tf](terraform/output.tf)


## Command Execution Output
curl -v --location --request POST 'https://5hcfgez98d.execute-api.ap-southeast-2.amazonaws.com/v1/customers' \
--header 'Content-Type: application/json' \
--header 'x-api-key: pm29mVTkaK99v2AXEg8KH2uHWuIlNK4L9KkW2FpT' \
--data-raw '{
    "firstname": "Raghunadh",
    "lastname": "Pokkalath",
    "email": "test@gmail.com"
}'

Note: Unnecessary use of -X or --request, POST is already inferred.
*   Trying 13.224.179.89...
* TCP_NODELAY set
* Connected to 5hcfgez98d.execute-api.ap-southeast-2.amazonaws.com (13.224.179.89) port 443 (#0)
* ALPN, offering h2
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*   CAfile: /etc/ssl/cert.pem
  CApath: none
* TLSv1.2 (OUT), TLS handshake, Client hello (1):
* TLSv1.2 (IN), TLS handshake, Server hello (2):
* TLSv1.2 (IN), TLS handshake, Certificate (11):
* TLSv1.2 (IN), TLS handshake, Server key exchange (12):
* TLSv1.2 (IN), TLS handshake, Server finished (14):
* TLSv1.2 (OUT), TLS handshake, Client key exchange (16):
* TLSv1.2 (OUT), TLS change cipher, Change cipher spec (1):
* TLSv1.2 (OUT), TLS handshake, Finished (20):
* TLSv1.2 (IN), TLS change cipher, Change cipher spec (1):
* TLSv1.2 (IN), TLS handshake, Finished (20):
* SSL connection using TLSv1.2 / ECDHE-RSA-AES128-GCM-SHA256
* ALPN, server accepted to use h2
* Server certificate:
*  subject: CN=*.execute-api.ap-southeast-2.amazonaws.com
*  start date: Jul  9 00:00:00 2020 GMT
*  expire date: Aug  9 12:00:00 2021 GMT
*  subjectAltName: host "5hcfgez98d.execute-api.ap-southeast-2.amazonaws.com" matched cert's "*.execute-api.ap-southeast-2.amazonaws.com"
*  issuer: C=US; O=Amazon; OU=Server CA 1B; CN=Amazon
*  SSL certificate verify ok.
* Using HTTP2, server supports multi-use
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* Using Stream ID: 1 (easy handle 0x7f952f00f600)
> POST /v1/customers HTTP/2
> Host: 5hcfgez98d.execute-api.ap-southeast-2.amazonaws.com
> User-Agent: curl/7.64.1
> Accept: */*
> Content-Type: application/json
> x-api-key: pm29mVTkaK99v2AXEg8KH2uHWuIlNK4L9KkW2FpT
> Content-Length: 92
> 
* Connection state changed (MAX_CONCURRENT_STREAMS == 128)!
* We are completely uploaded and fine
< HTTP/2 201 
< content-type: application/json
< content-length: 0
< date: Thu, 03 Sep 2020 14:19:04 GMT
< x-amzn-requestid: 69c338e6-a6ab-4f9b-9ead-a6e9a2c5013d
< x-amz-apigw-id: SSw1zG7dSwMFwcg=
< x-amzn-trace-id: Root=1-5f50fb58-e120e7925c1f648b4ec13dd2;Sampled=0
< x-cache: Miss from cloudfront
< via: 1.1 88f40be442aecae39e92819a37969961.cloudfront.net (CloudFront)
< x-amz-cf-pop: SYD1-C2
< x-amz-cf-id: 1sjAMllDVJUkMuZQM30uwy53R-Uf0w2sBmFCcCh_w2v1MlEPtttyUw==
< 
* Connection #0 to host 5hcfgez98d.execute-api.ap-southeast-2.amazonaws.com left intact
* Closing connection 0

### Setting up the Application
Please make below changes to run the application
1) Update below values in .env

AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=

2) Run below commands to bring up the application

Start the application

```
 make deploy 
````

Delete the application

````
make clean
````

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c06-serverless01](https://github.com/devopsacademyau/academy/blob/22bc97543c8193afc157cb3bc12e876d642c75ac/classes/06class/exercises/c06-serverless01/README.md)