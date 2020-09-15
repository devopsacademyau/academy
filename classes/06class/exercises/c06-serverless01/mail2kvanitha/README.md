# c06-serverless01

## Creating a POST API using API Gateway, Lambda and DynamoDB

- [_provider.tf](./terraform/_provider.tf)
- [main.tf](./terraform/)
- [output.tf](./terraform/output.tf)
- [Makefile](Makefile)
- [output.md](output.md)

## Command Execution Output
curl -v --request POST 'https://kxvan3zgik.execute-api.ap-southeast-2.amazonaws.com/test/customers' --header 'Content-Type: application/json' --header "x-api-key: Jf65mYBKen2IKoNckN2323QdEOwr6JvZ1eFXXJWG" --data-raw '{"firstname": "Maya", "lastname": "Vj", "email": "mayavj@y.com"}'
```
     Note: Unnecessary use of -X or --request, POST is already inferred.
     *   Trying 13.35.145.58...
     * TCP_NODELAY set
     * Connected to kxvan3zgik.execute-api.ap-southeast-2.amazonaws.com (13.35.145.58) port 443 (#0)
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
     *  subjectAltName: host "kxvan3zgik.execute-api.ap-southeast-2.amazonaws.com" matched cert's "*.execute-api.ap-southeast-2.amazonaws.com"
     *  issuer: C=US; O=Amazon; OU=Server CA 1B; CN=Amazon
     *  SSL certificate verify ok.
     * Using HTTP2, server supports multi-use
     * Connection state changed (HTTP/2 confirmed)
     * Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
     * Using Stream ID: 1 (easy handle 0x7fd333809800)
     > POST /test/customers HTTP/2
     > Host: kxvan3zgik.execute-api.ap-southeast-2.amazonaws.com
     > User-Agent: curl/7.64.1
     > Accept: */*
     > Content-Type: application/json
     > x-api-key: Jf65mYBKen2IKoNckN2323QdEOwr6JvZ1eFXXJWG
     > Content-Length: 64
     > 
     * Connection state changed (MAX_CONCURRENT_STREAMS == 128)!
     * We are completely uploaded and fine
     < HTTP/2 201 
     < content-type: application/json
     < content-length: 0
     < date: Tue, 15 Sep 2020 01:57:09 GMT
     < x-amzn-requestid: 04f98234-9c7b-41e9-aba8-feb140942b9f
     < x-amz-apigw-id: S4naIHfqywMFttQ=
     < x-amzn-trace-id: Root=1-5f601f73-14cb08c29b10b23d6bdcd221;Sampled=0
     < x-cache: Miss from cloudfront
     < via: 1.1 49a6e32d0e77764a9e697970808fdae9.cloudfront.net (CloudFront)
     < x-amz-cf-pop: SYD1-C1
     < x-amz-cf-id: Ep9_y229k1lBW_QR5jk-EevRR0spoHtWwOpPpfX_QlfpgkjKMYWN4A==
     < 
     * Connection #0 to host kxvan3zgik.execute-api.ap-southeast-2.amazonaws.com left intact
     * Closing connection 0 
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c06-serverless01](https://github.com/devopsacademyau/academy/blob/22bc97543c8193afc157cb3bc12e876d642c75ac/classes/06class/exercises/c06-serverless01/README.md)
