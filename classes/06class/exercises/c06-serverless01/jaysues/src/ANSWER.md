# c06-serverless01

## Creating a POST API using API Gateway, Lambda and DynamoDB

- [_provider.tf](_provider.tf)
- [main.tf](main.tf)
- [output.tf](output.tf)
- [Makefile](Makefile)
- [output.md](output.md)

## Command Execution Output
➜  src git:(jaysues/c06-serverless01) ✗   curl -v \
  -X POST https://950c7bymoj.execute-api.ap-southeast-2.amazonaws.com/v1/customers \
  -d "{\"firstname\": \"Justin\", \"lastname\": \"Hamilton\", \"email\": \"jaysues@gmail.com\"}" \
  -H "x-api-key: kmMf9SgcPa3CMfTuxRQkS6thIulNOAY0aL80sE3I"
Note: Unnecessary use of -X or --request, POST is already inferred.
*   Trying 13.35.147.42:443...
* Connected to 950c7bymoj.execute-api.ap-southeast-2.amazonaws.com (13.35.147.42) port 443 (#0)
* ALPN, offering h2
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*  CAfile: /etc/ssl/cert.pem
*  CApath: none
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
*  start date: Oct 18 00:00:00 2021 GMT
*  expire date: Nov 16 23:59:59 2022 GMT
*  subjectAltName: host "950c7bymoj.execute-api.ap-southeast-2.amazonaws.com" matched cert's "*.execute-api.ap-southeast-2.amazonaws.com"
*  issuer: C=US; O=Amazon; OU=Server CA 1B; CN=Amazon
*  SSL certificate verify ok.
* Using HTTP2, server supports multi-use
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* Using Stream ID: 1 (easy handle 0x137011000)
> POST /v1/customers HTTP/2
> Host: 950c7bymoj.execute-api.ap-southeast-2.amazonaws.com
> user-agent: curl/7.77.0
> accept: */*
> x-api-key: kmMf9SgcPa3CMfTuxRQkS6thIulNOAY0aL80sE3I
> content-length: 77
> content-type: application/x-www-form-urlencoded
> 
* Connection state changed (MAX_CONCURRENT_STREAMS == 128)!
* We are completely uploaded and fine
< HTTP/2 201 
< content-type: application/json
< content-length: 0
< date: Thu, 24 Feb 2022 03:13:16 GMT
< x-amzn-requestid: 9815c7a1-7d5f-4192-bc07-88c6c4be7174
< x-amz-apigw-id: OBun9E0ySwMFiDQ=
< x-amzn-trace-id: Root=1-6216f7cc-0b7ada30047d4c355ed87b71;Sampled=0
< x-cache: Miss from cloudfront
< via: 1.1 54fd8d6cde5c907e8ccf43b943423830.cloudfront.net (CloudFront)
< x-amz-cf-pop: SYD1-C1
< x-amz-cf-id: HzzcbAKRwrYQhh_V4jmcJcpcIH7OYenrtyQgwEAqJ3nyf2rMMA1acw==
< 
* Connection #0 to host 950c7bymoj.execute-api.ap-southeast-2.amazonaws.com left intact
➜  src git:(jaysues/c06-serverless01) ✗ 
<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c06-serverless01](https://github.com/devopsacademyau/academy/blob/22bc97543c8193afc157cb3bc12e876d642c75ac/classes/06class/exercises/c06-serverless01/README.md)