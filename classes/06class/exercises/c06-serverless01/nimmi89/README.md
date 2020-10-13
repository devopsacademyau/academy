# c06-serverless01

## Creating a POST API using API Gateway, Lambda and DynamoDB

- [_provider.tf](_provider.tf)
- [main.tf](main.tf)
- [output.tf](output.tf)
- [Makefile](Makefile)
- [output.md](output.md)

## Command Execution Output
```
$ curl -v <https://400gk3ery0.execute-api.ap-southeast-2.amazonaws.com/v1Serverless/users> -d "{\"firstname\": \"Nimmi\", \"lastname\": \"Varghese\", \"email\": \"nimmiv@gmail.com\"}" -H "x-api-key: 7ldK0vA1nK8G2nXPEgyhS8aDPgpGpQ8j9LAPJH5w"


*   Trying 54.253.95.27...
* TCP_NODELAY set
* Connected to 400gk3ery0.execute-api.ap-southeast-2.amazonaws.com (54.253.95.27) port 443 (#0)
* ALPN, offering h2
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*   CAfile: /etc/ssl/certs/ca-certificates.crt
  CApath: /etc/ssl/certs
* TLSv1.3 (OUT), TLS handshake, Client hello (1):
* TLSv1.3 (IN), TLS handshake, Server hello (2):
* TLSv1.2 (IN), TLS handshake, Certificate (11):
* TLSv1.2 (IN), TLS handshake, Server key exchange (12):
* TLSv1.2 (IN), TLS handshake, Server finished (14):
* TLSv1.2 (OUT), TLS handshake, Client key exchange (16):
* TLSv1.2 (OUT), TLS change cipher, Client hello (1):
* TLSv1.2 (OUT), TLS handshake, Finished (20):
* TLSv1.2 (IN), TLS handshake, Finished (20):
* SSL connection using TLSv1.2 / ECDHE-RSA-AES128-GCM-SHA256
* ALPN, server accepted to use h2
* Server certificate:
*  subject: CN=*.execute-api.ap-southeast-2.amazonaws.com
*  start date: Aug 30 00:00:00 2020 GMT
*  expire date: Sep 29 12:00:00 2021 GMT
*  subjectAltName: host "400gk3ery0.execute-api.ap-southeast-2.amazonaws.com" matched cert's "*.execute-api.ap-southeast-2.amazonaws.com"
*  issuer: C=US; O=Amazon; OU=Server CA 1B; CN=Amazon
*  SSL certificate verify ok.
* Using HTTP2, server supports multi-use
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* Using Stream ID: 1 (easy handle 0x5584fab3f580)
> POST /v1Serverless/users HTTP/2
> Host: 400gk3ery0.execute-api.ap-southeast-2.amazonaws.com
> User-Agent: curl/7.58.0
> Accept: */*
> x-api-key: 7ldK0vA1nK8G2nXPEgyhS8aDPgpGpQ8j9LAPJH5w
> Content-Length: 75
> Content-Type: application/x-www-form-urlencoded
>
* Connection state changed (MAX_CONCURRENT_STREAMS updated)!
* We are completely uploaded and fine
< HTTP/2 201
< date: Wed, 02 Sep 2020 05:09:35 GMT
< content-type: application/json
< content-length: 0
< x-amzn-requestid: 3ab1b018-3c3a-4e48-8c49-19ffffd33616
< x-amz-apigw-id: SONaVFTxywMFxUQ=
< x-amzn-trace-id: Root=1-5f4f290e-18c3c53088abd1c8a7c2a24c;Sampled=0
<
* Connection #0 to host 400gk3ery0.execute-api.ap-southeast-2.amazonaws.com left intact

```


 
***
Answer for exercise [c06-serverless01](https://github.com/devopsacademyau/academy/blob/cdbf8008dd42eacd5aa6f43f66b152e8f91d0e78/classes/06class/exercises/c06-serverless01/README.md)
