# c06-serverless01

## Creating a POST API using API Gateway, Lambda and DynamoDB

- [_provider.tf](_provider.tf)
- [main.tf](main.tf)
- [output.tf](outputs.tf)
- [Makefile](Makefile)

## Command Execution Output
```
curl -v -X POST https://hl8dk18anf.execute-api.ap-southeast-2.amazonaws.com/v1/customers -d "{\"firstname\": \"Jayanath\", \"lastname\": \"Amaranayake\", \"email\": \"buwa@buwa.com\"}" -H "x-api-key: <MY_API_KEY>"

```
```
Note: Unnecessary use of -X or --request, POST is already inferred.
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0*   Trying 13.55.248.139...
* TCP_NODELAY set
* Connected to hl8dk18anf.execute-api.ap-southeast-2.amazonaws.com (13.55.248.139) port 443 (#0)
* ALPN, offering h2
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*   CAfile: /etc/ssl/cert.pem
  CApath: none
* TLSv1.2 (OUT), TLS handshake, Client hello (1):
} [265 bytes data]
* TLSv1.2 (IN), TLS handshake, Server hello (2):
{ [98 bytes data]
* TLSv1.2 (IN), TLS handshake, Certificate (11):
{ [4879 bytes data]
* TLSv1.2 (IN), TLS handshake, Server key exchange (12):
{ [333 bytes data]
* TLSv1.2 (IN), TLS handshake, Server finished (14):
{ [4 bytes data]
* TLSv1.2 (OUT), TLS handshake, Client key exchange (16):
} [70 bytes data]
* TLSv1.2 (OUT), TLS change cipher, Change cipher spec (1):
} [1 bytes data]
* TLSv1.2 (OUT), TLS handshake, Finished (20):
} [16 bytes data]
* TLSv1.2 (IN), TLS change cipher, Change cipher spec (1):
{ [1 bytes data]
* TLSv1.2 (IN), TLS handshake, Finished (20):
{ [16 bytes data]
* SSL connection using TLSv1.2 / ECDHE-RSA-AES128-GCM-SHA256
* ALPN, server accepted to use h2
* Server certificate:
*  subject: CN=*.execute-api.ap-southeast-2.amazonaws.com
*  start date: Aug 30 00:00:00 2020 GMT
*  expire date: Sep 29 12:00:00 2021 GMT
*  subjectAltName: host "hl8dk18anf.execute-api.ap-southeast-2.amazonaws.com" matched cert's "*.execute-api.ap-southeast-2.amazonaws.com"
*  issuer: C=US; O=Amazon; OU=Server CA 1B; CN=Amazon
*  SSL certificate verify ok.
* Using HTTP2, server supports multi-use
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* Using Stream ID: 1 (easy handle 0x7fbe04008200)
> POST /v1/customers HTTP/2
> Host: hl8dk18anf.execute-api.ap-southeast-2.amazonaws.com
> User-Agent: curl/7.64.1
> Accept: */*
> x-api-key: <MY_API_KEY>
> Content-Length: 78
> Content-Type: application/x-www-form-urlencoded
>
* Connection state changed (MAX_CONCURRENT_STREAMS == 128)!
} [78 bytes data]
* We are completely uploaded and fine
100    78    0     0  100    78      0     61  0:00:01  0:00:01 --:--:--    61< HTTP/2 201
< date: Sat, 12 Sep 2020 03:36:30 GMT
< content-type: application/json
< content-length: 0
< x-amzn-requestid: b8b6c6ce-1851-4e9b-93ca-e38bac9c12b8
< x-amz-apigw-id: Su9JoGzzywMFmVA=
< x-amzn-trace-id: Root=1-5f5c423d-12669d687c4a491818c4ce30;Sampled=0
<
{ [0 bytes data]
100    78    0     0  100    78      0     52  0:00:01  0:00:01 --:--:--    52
* Connection #0 to host hl8dk18anf.execute-api.ap-southeast-2.amazonaws.com left intact
* Closing connection 0
```



***
Answer for exercise [c06-serverless01](https://github.com/devopsacademyau/academy/blob/22bc97543c8193afc157cb3bc12e876d642c75ac/classes/06class/exercises/c06-serverless01/README.md)