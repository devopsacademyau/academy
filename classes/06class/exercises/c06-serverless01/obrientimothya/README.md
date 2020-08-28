# c06-serverless01

## Creating a POST API using API Gateway, Lambda and DynamoDB

- [_provider.tf](_provider.tf)
- [main.tf](main.tf)
- [output.tf](output.tf)
- [Makefile](Makefile)
- [output.md](output.md)

## Command Execution Output

```
$ curl -v -X POST https://ltef5ze76a.execute-api.ap-southeast-2.amazonaws.com/v1/customers -d "{\"firstname\": \"Timothy\", \"lastname\": \"OBrien\", \"email\": \"obrien.timothy.a@gmail.com\"}" -H "x-api-key: Vx0EYnsISl6x6gvnp7Sdh4CMbqb9AJKC3npTesLc"

Note: Unnecessary use of -X or --request, POST is already inferred.
*   Trying 13.35.145.97...
* TCP_NODELAY set
* Connected to ltef5ze76a.execute-api.ap-southeast-2.amazonaws.com (13.35.145.97) port 443 (#0)
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
*  start date: Dec 19 00:00:00 2019 GMT
*  expire date: Jan 19 12:00:00 2021 GMT
*  subjectAltName: host "ltef5ze76a.execute-api.ap-southeast-2.amazonaws.com" matched cert's "*.execute-api.ap-southeast-2.amazonaws.com"
*  issuer: C=US; O=Amazon; OU=Server CA 1B; CN=Amazon
*  SSL certificate verify ok.
* Using HTTP2, server supports multi-use
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* Using Stream ID: 1 (easy handle 0x7fabc680e400)
> POST /v1/customers HTTP/2
> Host: ltef5ze76a.execute-api.ap-southeast-2.amazonaws.com
> User-Agent: curl/7.64.1
> Accept: */*
> x-api-key: Vx0EYnsISl6x6gvnp7Sdh4CMbqb9AJKC3npTesLc
> Content-Length: 85
> Content-Type: application/x-www-form-urlencoded
>
* Connection state changed (MAX_CONCURRENT_STREAMS == 128)!
* We are completely uploaded and fine
< HTTP/2 201
< content-type: application/json
< content-length: 0
< date: Fri, 28 Aug 2020 10:41:07 GMT
< x-amzn-requestid: 0d71c67a-1fa3-40a5-90da-a0a754610dab
< x-amz-apigw-id: R-fSjGM_SwMFpvw=
< x-amzn-trace-id: Root=1-5f48df43-2c7f6e56d610459e4f47fa42;Sampled=0
< x-cache: Miss from cloudfront
< via: 1.1 098fddbcdf00e65b8479d1d17b41d28a.cloudfront.net (CloudFront)
< x-amz-cf-pop: SYD1-C1
< x-amz-cf-id: hiyom8ZYgQqnNB-oYHLlBN6_G3gFz47Xc_JFHTskJSUAI-HZJHjb6A==
<
* Connection #0 to host ltef5ze76a.execute-api.ap-southeast-2.amazonaws.com left intact
* Closing connection 0
```

***
Answer for exercise [c06-serverless01](https://github.com/devopsacademyau/academy/blob/cdbf8008dd42eacd5aa6f43f66b152e8f91d0e78/classes/06class/exercises/c06-serverless01/README.md)
