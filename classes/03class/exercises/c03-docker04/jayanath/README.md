# C03-Docker04


## Command Execution Output
- Commands executed to clean up both the images and the containers(running or exited) from your local:
```
## List all the containers
> docker ps -a
    CONTAINER ID        IMAGE                         COMMAND                  CREATED             STATUS                     PORTS                  NAMES
    4b8eca0527c8        exercise02:v2                 "httpd-foreground"       22 minutes ago      Exited (0) 5 seconds ago                          container-v2
    65a0aa6bbf7c        exercise02:v1                 "httpd-foreground"       2 hours ago         Exited (0) 5 seconds ago                          sharp_raman
    1779cad272e8        exercise02:v2                 "httpd-foreground"       3 hours ago         Created                                           stoic_payne
    3689c0303a99        exercise02:v2                 "-v ../../../docker/…"   3 hours ago         Created                    0.0.0.0:8082->80/tcp   crazy_faraday
    bceb90069384        exercise02:v1                 "httpd-foreground"       9 hours ago         Exited (0) 9 hours ago                            confident_ride
    84d7b98fac10        exercise02:v1                 "httpd-foreground"       9 hours ago         Exited (0) 9 hours ago                            jovial_nash
    b7db0cc94066        exercise02:v1                 "-d"                     9 hours ago         Created                    0.0.0.0:8081->80/tcp   fervent_poitras
    9de1b3f4eb4e        exercise02:v1                 "httpd-foreground"       9 hours ago         Exited (0) 9 hours ago                            sweet_dijkstra
    80c8fec8a352        da-terraform:c03-docker-e01   "terraform -v"           24 hours ago        Exited (0) 24 hours ago                           upbeat_hoover
    b0d30416ba81        jayanath_web                  "docker-php-entrypoi…"   26 hours ago        Exited (0) 26 hours ago                           jayanath_web_1
    c80929822989        mysql:5.7                     "docker-entrypoint.s…"   26 hours ago        Exited (0) 26 hours ago                           jayanath_db_1
    27cdddeaac9f        docker/whalesay               "cowsay boo"             2 weeks ago         Exited (0) 2 weeks ago                            agitated_morse
    05200877ab07        docker/whalesay:latest        "/bin/bash"              2 weeks ago         Exited (0) 2 weeks ago                            nice_antonelli

## Stop all the containers that are running
> docker stop $(docker ps -aq)
    4b8eca0527c8
    65a0aa6bbf7c
    1779cad272e8
    3689c0303a99
    bceb90069384
    84d7b98fac10
    b7db0cc94066
    9de1b3f4eb4e
    80c8fec8a352
    b0d30416ba81
    c80929822989
    27cdddeaac9f
    05200877ab07

## Remove all the containers
> docker rm $(docker ps -aq)
    4b8eca0527c8
    65a0aa6bbf7c
    1779cad272e8
    3689c0303a99
    bceb90069384
    84d7b98fac10
    b7db0cc94066
    9de1b3f4eb4e
    80c8fec8a352
    b0d30416ba81
    c80929822989
    27cdddeaac9f
    05200877ab07

## List all the images
> docker images
    REPOSITORY            TAG                 IMAGE ID            CREATED             SIZE
    jayforweb/teleport    exercise02v2        2a1e5faf5efb        7 hours ago         107MB
    jayforweb/teleport    v2                  2a1e5faf5efb        7 hours ago         107MB
    exercise02            v2                  2a1e5faf5efb        7 hours ago         107MB
    jayforweb/teleport    exercise02v1        ab60662f25b7        9 hours ago         107MB
    jayforweb/teleport    v1                  ab60662f25b7        9 hours ago         107MB
    exercise02            v1                  ab60662f25b7        9 hours ago         107MB
    da-terraform          c03-docker-e01      12291e0cc02b        25 hours ago        76.7MB
    <none>                <none>              817742c94c47        25 hours ago        105MB
    jayanath_web          latest              b4e121e6fc01        27 hours ago        432MB
    php                   7.4-apache          77c1bf5b4475        4 weeks ago         414MB
    <none>                <none>              16e41f1626dd        4 weeks ago         121MB
    <none>                <none>              5c2464ac6707        4 weeks ago         220MB
    <none>                <none>              477808905550        4 weeks ago         108MB
    golang                latest              5fbd6463d24b        4 weeks ago         810MB
    mysql                 5.7                 9cfcce23593a        4 weeks ago         448MB
    python                alpine              8ecf5a48c789        5 weeks ago         78.9MB
    node                  12-alpine           1c342643aa5c        5 weeks ago         89.4MB
    nginx                 alpine              7d0cdcc60a96        5 weeks ago         21.3MB
    alpine                latest              a24bb4013296        5 weeks ago         5.57MB
    kindest/node          <none>              de6eb7df13da        2 months ago        1.25GB
    httpd                 2.4.41-alpine       54b0995a6305        3 months ago        107MB
    openjdk               12-alpine           0c68e7c5b7a0        17 months ago       339MB
    docker/whalesay       latest              6b362a9f73eb        5 years ago         247MB

## Remove all the images
> docker rmi -f $(docker images -aq)

    Untagged: jayforweb/teleport:exercise02v1
    Untagged: jayforweb/teleport:v1
    Untagged: jayforweb/teleport@sha256:1dcd016893aa7f562ae2901627ac6d2a8e27248f567f46b354897174509b097f
    Untagged: exercise02:v1
    Deleted: sha256:ab60662f25b7942c3f7a224e72749e38e3d69429245cdc87a4c377946cd6e246
    Deleted: sha256:aee61a2342349d5b173517aa9388f78aa01b99b4856a9c03f46cc888ae0d0d76
    Deleted: sha256:8af183813a69f9eebc08ba544ce4bca2441d62b81ab33d73d695de90ced2ff0a
    Untagged: jayforweb/teleport:exercise02v2
    Untagged: jayforweb/teleport:v2
    Untagged: jayforweb/teleport@sha256:59a5740f4268e3535b72541f4694eb7c677a1da1c3177b1ab127d2bc95ec0bcd
    Untagged: exercise02:v2
    Deleted: sha256:2a1e5faf5efbbb56599b651bd5392b7f042146ef0dc2fbf52e1b0859fcaf593c
    Deleted: sha256:0f5db4bbfb87e699e2496e8220720f8168e9b173120b4d621bd81495301dfcaf
    Deleted: sha256:69b244ea75cec0abd8c9df60d0d878d6a3a8629cc4e5c912d7698788294d03de
    Untagged: da-terraform:c03-docker-e01
    Deleted: sha256:12291e0cc02b4a60cc7ceb1b1a406c514cb29e29e670c48a10ecbfc6415801dc
    Deleted: sha256:51c210ac5de2cc7ef98ef191f370bac694351c738f4c635d9d1579115eb69101
    Deleted: sha256:4b831bc53fc2e9652d39b723cf38429d8550ac6ccf9183ec0fb3a8fd1cd71895
    Deleted: sha256:817742c94c47bebbefadbb1ea0264239ee6a5b9cb842cf905071b2a7ece9d984
    Deleted: sha256:ff14b4a116118a65da572082ffa44e0d643f084e50b0fc84024252d500d4493d
    Deleted: sha256:b27f18946e791d3ce05551531b54a129d0a37bea5bbf1df2d03c96bd01bef41b
    Deleted: sha256:f5bc959775bd2ff4d001a24ae494d3a0944144f3d1b45710892c7dd0ecbb9d9a
    Deleted: sha256:982ea5f363058ee83c0a68a4f081dbfde8208da83de01cab6a1b5487b06af868
    Deleted: sha256:86c2dcabd74452bd14f0ff9f1e5b022c89845601f2673bd18707171d96793325
    Deleted: sha256:459c93021b893c51c8fcf2a478af067fcfc2df5b5450db90fcdaaf0508fd1ac3
    Deleted: sha256:eab14bc62fe6822d5e3e2622d7fa1cb348b5628f0144808941cd9e683901834c
    Deleted: sha256:83fa1f5444d862354bf2f663a0c85916178f85d1eb0fb592ec1835cd2f6f9875
    Deleted: sha256:eb77ab3abd1171f338b8fd466d2732b41af0fc0005edcb82af72ee0c2ae20c49
    Deleted: sha256:6cbbfa1d1538e12f8811fa8936a99616ffc3f3a4485b46cdd93025a07869318f
    Untagged: jayanath_web:latest
    Deleted: sha256:b4e121e6fc019f4774e1badd65ca57f213ea8ed1c41225eae39b05ee4305a598
    Deleted: sha256:4c4d580371860bc6b5847e98d91badf483df16a464fb83d502176b5a40255f08
    Deleted: sha256:3d5d7bd1e553657e2dec1589a8282ddb3db151ca5f052f07f4f9f45439a5adbc
    Deleted: sha256:9790f8d7e86e1be19d4ba5b39acecdcbc203624ce46d02848bd52c38787b2d21
    Deleted: sha256:45771a3c6128c24f5bba242b0549ed13a7be49cdd6480064042ab40120ed6063
    Deleted: sha256:c6a513183ddcdfdf1dc1ef1cdfc1062c060c4448aac01a2fb93153ba1924db0b
    Untagged: php:7.4-apache
    Untagged: php@sha256:645c05bf7317ed0c154d1755c5a602c46f750fe14faff907d6d977332202ff71
    Deleted: sha256:77c1bf5b4475987b620513915ec1fc693b3dde48970399efe89103f089d49928
    Deleted: sha256:f1242cb1b30823d743b45de5c0aa9fc84be372fc3477f1f66c43f6500c7a1fcc
    Deleted: sha256:9f2fb7b8b35dbe8b4c3cf76b97a64bc8f01d6807d99cd2d7cf0ffc8dc7c0392b
    Deleted: sha256:e300279f9450cd912abc03dc6051d2cfdc0cf039effb6b0ea453f1dd4c2447eb
    Deleted: sha256:1d3599bfcbc4a14cb1914a303ca2421075006af5216eff187254d530863bbf30
    Deleted: sha256:0d5d3086126b359dd4fe3ae2a38c8111f29c2fa317fac8e89797a588da5617f6
    Deleted: sha256:8bd7af85d79ecabbd7c5b265c70470b7f6485df3ffc6102c1bba3b2d2517f5aa
    Deleted: sha256:ea2f7da262f5950ea9ae484670b7500c87b084188e2b698a9bdfff5148b50149
    Deleted: sha256:778c4c29e21ec0755e8880061286218803fe479b48c9ec19c6e9eaafd6026dda
    Deleted: sha256:e2fcd756d3c70181a135f62d9e2a764e4da9c69b670fa0b6a6c56d8a8637a795
    Deleted: sha256:4a8fedff65e4a763a882cbd60cca1357fe5af60065a3249cd91ed16acadf2400
    Deleted: sha256:ce18f9bfd73869c02e4ae67a4da75a6713053bfc78a0af5aa21fddb5b6639017
    Deleted: sha256:fc48b4e1b964b1841c0f8f59b168a4271b8d467d846fc1e8ba91b070226b7ccc
    Deleted: sha256:16e41f1626ddd406ca7d1ee804c270ded133c50d7ac3b28bc807ad3b0a6a5bf7
    Deleted: sha256:d04ea4a06e14b3d40e32ed0ddc1ebc60c1356d90c3968e988de2d2b02182938d
    Deleted: sha256:e51d0ea0cbac59f72788985567e142b5c80b80321973cd8f44811183344bbc50
    Deleted: sha256:a251a651a5285dd5ea9a05a8bc0f46b560fc49205b181b403860f29c88a1a733
    Deleted: sha256:4778089055505c4382a1a62017e810ca71de5ffae0941b5a8bca426adf3f5bbd
    Deleted: sha256:1bcd2a184044602df65ce45ccfe280327cade2653524b6f1470e7477e7e234fb
    Deleted: sha256:8614bcdfbacdfae946b27485f43bb3e9eb3b572dcfd72b26b6036176d579a51e
    Deleted: sha256:764a5a2705ce424b54c775c44ed981aa26431ad39942d8f64d31193e6250c7fd
    Deleted: sha256:44cf427496bb6948bc6a5321fa8883c6b94594ddabc14424ea3dc17cfefdb9f3
    Deleted: sha256:eefe9fdb1ee47ec4b36aca4acdc8843d1053fe5ab41d1d259760daaf5d9d3225
    Deleted: sha256:5f20b7b393ea3119b4663d914740e28891eb0465fc9f7d7fa3c2bfb06cff7794
    Deleted: sha256:5c2464ac6707f6e3f3328a12becd9ff9dca1df1d5cac01a34738587bd582b3be
    Deleted: sha256:6e19f1c24ff44b39be9a7ac54ade82d4a8ac35e470ab765596c2aee76490e93b
    Deleted: sha256:c4e431dc06952293d556606e8da5071b8ce0b7b958c8639b322dae7d8ee31fa3
    Deleted: sha256:c747bda514e610b4cc07a7860d30318472ce48da32e7d6dcac5eccf2b741e027
    Deleted: sha256:234fd931d43dfca1cdbe00641ca04747d1cf83ed3d8bf040982e031368fa2404
    Deleted: sha256:16161fcae7e32da9fd42ddbfaa11a6b51af4c342ad479c1a42fa113ea42657bb
    Deleted: sha256:a4f5177c9c26732ee1ba59ffde8a533ed0765d3da6845b2e58fd045878c4f170
    Deleted: sha256:2c046f4a2768ae47736bb621e70350b06c9f926627a7ea726ff671838a613a45
    Deleted: sha256:31461cfd40c5c181af5a96e15da1530f024259e6cde4e8d139252bfbd0b8930e
    Deleted: sha256:3b8636958a8ca8d2d546bbd409a6bbf8fc0a145c5ec8dd7d97bcd24eb1a0d397
    Deleted: sha256:c3bd2443d7a27ee6592292a2594957cdd039eb1b67d35c1755fbb9e6b2400c37
    Deleted: sha256:74524fb76333c7386367a79b137c68ceb433204df1945ba0387a1a16841425c2
    Deleted: sha256:6fff28ae955acd356e4841cf36d66ba4b7363e97844a3b0fd0aa507397a2139c
    Deleted: sha256:ea55f06dfec6b8efa0129af5da2fe532365253e375ccb254cd5cf4a28e1b55ee
    Untagged: golang:latest
    Untagged: golang@sha256:ede9a57fa6d862ab87f5abcea707c3d55e445ff01d806334a1cb7aae45ec73bb
    Deleted: sha256:5fbd6463d24bad24f3fa3e7c0023cd6aeac7ed7689e67a7f75bab0954427862f
    Deleted: sha256:6e874a1e9ea151e6bceff175b5334c787ca609bdbac8698d717cbd9c971e15ff
    Deleted: sha256:31fafffdecaad13ec5af59d6cb0ce5cda3130f88c245fad1ebf9fa791ec82658
    Deleted: sha256:fc4185cb4a9bc327b2f4057a88be253caf56959052a1eaa95a3b585eaabc4bc5
    Deleted: sha256:f863ffb247f4c239aeccf155b7c0d92e35403aed0c825690f6739a89a5901a7c
    Deleted: sha256:d39c04f36d47ec7121d94577c33c2792aa6e5a5a2c1130ea0be67a96d4e42ba5
    Deleted: sha256:7ef5d661de63acc27e877ff7098e93fd9d915f9688e8b585af1b3cccafd76243
    Deleted: sha256:8803ef42039dcbe936755e9baae4bb7b19cb0fb6a438eb3992950cd0afef8e4f
    Untagged: mysql:5.7
    Untagged: mysql@sha256:32f9d9a069f7a735e28fd44ea944d53c61f990ba71460c5c183e610854ca4854
    Deleted: sha256:9cfcce23593a93135ca6dbf3ed544d1db9324d4c40b5c0d56958165bfaa2d46a
    Deleted: sha256:98de3e212919056def8c639045293658f6e6022794807d4b0126945ddc8324be
    Deleted: sha256:17e8b88858e400f8c5e10e7cb3fbab9477f6d8aacba03b8167d34a91dbe4d8c1
    Deleted: sha256:c04c087c2af9abd64ba32fe89d65e6d83da514758923de5da154541cc01a3a1e
    Deleted: sha256:ab8bf065b402b99aec4f12c648535ef1b8dc954b4e1773bdffa10ae2027d3e00
    Deleted: sha256:09687cd9cdf4c704fde969fdba370c2d848bc614689712bef1a31d0d581f2007
    Deleted: sha256:b704a4a65bf536f82e5d8b86e633d19185e26313de8380162e778feb2852011a
    Deleted: sha256:c37206160543786228aa0cce738e85343173851faa44bb4dc07dc9b7dc4ff1c1
    Deleted: sha256:12912c9ec523f648130e663d9d4f0a47c1841a0064d4152bcf7b2a97f96326eb
    Deleted: sha256:57d29ad88aa49f0f439592755722e70710501b366e2be6125c95accc43464844
    Deleted: sha256:b17c024283d0302615c6f0c825137da9db607d49a83d2215a79733afbbaeb7c3
    Deleted: sha256:13cb14c2acd34e45446a50af25cb05095a17624678dbafbcc9e26086547c1d74
    Untagged: python:alpine
    Untagged: python@sha256:c5623df482648cacece4f9652a0ae04b51576c93773ccd43ad459e2a195906dd
    Deleted: sha256:8ecf5a48c789c6762846613726831aa4e818570a0f2c5eea0250838da846261c
    Deleted: sha256:f3de8064cfad2e1310a7dfaa303600dd98be958aef6528f9c1776a96a0657e5c
    Deleted: sha256:88efa95f4e3ce2aef9168cc05f8fac4eb8acdc233729c9ffbc75e54834dd5aab
    Deleted: sha256:95b3c8b6bc66ef055ed459a05899d68d4340bca30a6a4f520ac8b5d5a53611ca
    Deleted: sha256:568efafabdbb713c0daa32533cb71aba1dd3cd1750b4713cb68f3ec3088a70ac
    Untagged: node:12-alpine
    Untagged: node@sha256:613e489b8528cbdbeb61c528880bc082c91321f3f1f02efa97f08066c7b1985f
    Deleted: sha256:1c342643aa5c48e0286398631c0f5d03e06688750e9ab937abbb19749f7453e8
    Deleted: sha256:607ff2a2717fcba284e9af0b65bda7b8eaab313e2fd09386cd65dc5b6fded98e
    Deleted: sha256:7c042e44758737972a09bb2eb18fdc21e364a88176876b940e8ff20ba21f1b31
    Deleted: sha256:af9564a42559d321d3f2a3c16adeb06678c0ba833b4d1cb16ec015d500a9e735
    Untagged: nginx:alpine
    Untagged: nginx@sha256:b89a6ccbda39576ad23fd079978c967cecc6b170db6e7ff8a769bf2259a71912
    Deleted: sha256:7d0cdcc60a96a5124763fddf5d534d058ad7d0d8d4c3b8be2aefedf4267d0270
    Deleted: sha256:05a0eaca15d731e0029a7604ef54f0dda3b736d4e987e6ac87b91ac7aac03ab1
    Deleted: sha256:c6bbc4bdac396583641cb44cd35126b2c195be8fe1ac5e6c577c14752bbe9157
    Deleted: sha256:35789b1e1a362b0da8392ca7d5759ef08b9a6b7141cc1521570f984dc7905eb6
    Deleted: sha256:a3efaa65ec344c882fe5d543a392a54c4ceacd1efd91662d06964211b1be4c08
    Deleted: sha256:3e207b409db364b595ba862cdc12be96dcdad8e36c59a03b7b3b61c946a5741a
    Untagged: alpine:latest
    Untagged: alpine@sha256:185518070891758909c9f839cf4ca393ee977ac378609f700f60a771a2dfe321
    Deleted: sha256:a24bb4013296f61e89ba57005a7b3e52274d8edd3ae2077d04395f806b63d83e
    Deleted: sha256:50644c29ef5a27c9a40c393a73ece2479de78325cae7d762ef3cdc19bf42dd0a
    Untagged: kindest/node@sha256:7b27a6d0f2517ff88ba444025beae41491b016bc6af573ba467b70c5e8e0d85f
    Deleted: sha256:de6eb7df13da0a683275610d82093f58342afa1781156009aacca451029a97fa
    Deleted: sha256:47e01268088c30c9074929dd64b1171fbc0f427e2aaeaf857e762b0e31a74a41
    Deleted: sha256:8e2082e70108c8df6b450f96644b10b43d1463a8e3e34a864c5c8d47694162b9
    Deleted: sha256:97c07251e6d5694172d31e1b362a12d516a3c03c64361a1d30be310932af709d
    Deleted: sha256:89ccfdff362975556ddc6f2b9ca332a68545ec1d8828c00d2f95a61f4c682662
    Deleted: sha256:65b9026bb14de72373c47529961755ad7b15ee1a70cf4a203a02ce5fe8685ac3
    Deleted: sha256:37425d50012d7b756bc058054b3ea81627dd239fb72dea7ad064cf5ec83d633c
    Deleted: sha256:a4507fabd147fb46a7cba44bfea25af1f72eb325bfc7e52f3eafb38492629585
    Untagged: httpd:2.4.41-alpine
    Untagged: httpd@sha256:06ad90574c3a152ca91ba9417bb7a8f8b5757b44d232be12037d877e9f8f68ed
    Deleted: sha256:54b0995a630527d5e8db6dfee1fedace23d145d7b916a455e0c8380db974d81c
    Deleted: sha256:7cc2d2925b2b34f2dd686affc440499fa783c4ab357be56c5c49344dbd40d5ce
    Deleted: sha256:72a14eca8a5cfa546ea7c391135969bf4a05ffa19518ff4441f66cadcc906fd9
    Deleted: sha256:09427ece5b0c3fb84f7f65b61418e9a0cf31671722149b3d4688d29a61f8c0e4
    Deleted: sha256:606838becbce6cc233c0d188ba9c137e32692aa75cedf12fda078512dfc8845c
    Deleted: sha256:beee9f30bc1f711043e78d4a2be0668955d4b761d587d6f60c2c8dc081efb203
    Untagged: openjdk:12-alpine
    Untagged: openjdk@sha256:fecd532eaee349b4d9e329148e99de77ffaf803e66e184a0e4d6b946bb97ffa3
    Deleted: sha256:0c68e7c5b7a0cb1612ea7b14c460d1f165ae7250b8aa7a0e5e53ae6cdc846310
    Deleted: sha256:b7fb67bfb201fca38b0582f37f049f08c541a83dfc12b709dfbf3092428c96ce
    Deleted: sha256:503e53e365f34399c4d58d8f4e23c161106cfbce4400e3d0a0357967bad69390
    Untagged: docker/whalesay:latest
    Untagged: docker/whalesay@sha256:178598e51a26abbc958b8a2e48825c90bc22e641de3d31e18aaf55f3258ba93b
    Deleted: sha256:6b362a9f73eb8c33b48c95f4fcce1b6637fc25646728cf7fb0679b2da273c3f4
    Deleted: sha256:34dd66b3cb4467517d0c5c7dbe320b84539fbb58bc21702d2f749a5c932b3a38
    Deleted: sha256:52f57e48814ed1bb08a651ef7f91f191db3680212a96b7f318bff0904fed2e65
    Deleted: sha256:72915b616c0db6345e52a2c536de38e29208d945889eecef01d0fef0ed207ce8
    Deleted: sha256:4ee0c1e90444c9b56880381aff6455f149c92c9a29c3774919632ded4f728d6b
    Deleted: sha256:86ac1c0970bf5ea1bf482edb0ba83dbc88fefb1ac431d3020f134691d749d9a6
    Deleted: sha256:5c4ac45a28f91f851b66af332a452cba25bd74a811f7e3884ed8723570ad6bc8
    Deleted: sha256:088f9eb16f16713e449903f7edb4016084de8234d73a45b1882cf29b1f753a5a
    Deleted: sha256:799115b9fdd1511e8af8a8a3c8b450d81aa842bbf3c9f88e9126d264b232c598
    Deleted: sha256:3549adbf614379d5c33ef0c5c6486a0d3f577ba3341f573be91b4ba1d8c60ce4
    Deleted: sha256:1154ba695078d29ea6c4e1adb55c463959cd77509adf09710e2315827d66271a
```

- Command and it's output showing that there is no image or container on your local. Use only TEXT for the command output, don't include images (JPEG, PNG, etc):
```
## Clean slate :-)
> docker images

    REPOSITORY            TAG                 IMAGE ID            CREATED             SIZE

```

***
Answer for exercise [c03-docker04](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker04/README.md)