# C03-Docker04


## Command Execution Output
- Commands executed to clean up both the images and the containers(running or exited) from your local:
```
$ docker container stop $(docker ps -a -q)
1ab91d9b736b
644df6e0da6a
3d845aa62dcd
16bee6a43e51
f4127895dbe5
003ea19af23c
c7a5c6666a4b
58326b10d29e
d026c229c226
9692fb443c35
fdb0fe5c7b93
703393200f31
89fb3d9dd1eb
767af7dec8dd
d252f5036cf2
e21b385fbf56
c4057eee667c
92c17e8aa688
3a0bcbe13ad6
75a8033a814f
a38dac974b71
e5bcd713b699
a228d67823b0
bb7d48178928
0ce2241e2120
4ed46d9dade1
0d55e5adc2e0

$ docker container rm $(docker ps -a -q)
1ab91d9b736b
644df6e0da6a
3d845aa62dcd
16bee6a43e51
f4127895dbe5
003ea19af23c
c7a5c6666a4b
58326b10d29e
d026c229c226
9692fb443c35
fdb0fe5c7b93
703393200f31
89fb3d9dd1eb
767af7dec8dd
d252f5036cf2
e21b385fbf56
c4057eee667c
92c17e8aa688
3a0bcbe13ad6
75a8033a814f
a38dac974b71
e5bcd713b699
a228d67823b0
bb7d48178928
0ce2241e2120
4ed46d9dade1
0d55e5adc2e0

$ docker image rmi $(docker images -q)
Deleted: sha256:38d6a852919f46e80a8690530333e90589738915cc499f07bdb059a0206a6c5e
Deleted: sha256:4a7fc80fd2d57077fc158240a768dee8bf95e040ce5eba8252683d6ad0fd2685
Deleted: sha256:da7f600cb8c9db7b9f13c04add434c14099569261c16dfa49183cb96a3b967e3
Deleted: sha256:c2d3ac0e192513b8f1daef2bceab581de0579e9e03b271a2f3817940664aeb8b
Untagged: da-terraform:c03-docker-e01
Deleted: sha256:8004d77f099cb8c5ddb20093b1253b44686ac1173da9a2ba5daa9c4c3e2619f1
Deleted: sha256:6fcdd5f11860978dba37f1df4b07b7ef68f5592fb0cdedd9424dcd40dc7d6711
Deleted: sha256:643a0dc61780c645454f3c3464b746d6d5f554b93b98502c8eecd3347999b4c6
Deleted: sha256:d67563a609b7e0ab4cc90e33165d58992431f86b8902e299a7e3578ace630326
Deleted: sha256:1a97ef1f98815093d8cf972fd649a54dad8292b7489718134b24140e587d195f
Deleted: sha256:39d80a797cd865faa988121540425cbed0415e958e85ef80ca4b845283ce449c
Untagged: docker_web:latest
Deleted: sha256:97e95f22ba11e9193f676329dd7e8084291901817e29827b19fcf7020c27d9d0
Deleted: sha256:357b0e41473f9194e4947f8da15b1204dc2d44677fd10132a1834ff67c073c69
Deleted: sha256:de5f3612159a813e5dda2126ef59800be135cfc4ac3dab10958cb9de512f685d
Deleted: sha256:90f937019dc3a38291b93022e48a93e18d3760b8cae9afc6ed45e6d0725e6b1e
Deleted: sha256:c1310d7ad930b52d65800e027e7aabca8c5ee34e276b305155c0949b8b17bea8
Deleted: sha256:2f87520da7f22d9fb68fb670a62dfae01b7dc3f34dce4dd53aabfbd27dba67ca
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
Untagged: alpine:3.12.0
Untagged: alpine@sha256:185518070891758909c9f839cf4ca393ee977ac378609f700f60a771a2dfe321
Deleted: sha256:a24bb4013296f61e89ba57005a7b3e52274d8edd3ae2077d04395f806b63d83e
Deleted: sha256:50644c29ef5a27c9a40c393a73ece2479de78325cae7d762ef3cdc19bf42dd0a
Untagged: docker/getting-started:latest
Untagged: docker/getting-started@sha256:d2c4fb0641519ea208f20ab03dc40ec2a5a53fdfbccca90bef14f870158ed577
Deleted: sha256:3c156928aeec9595a140d3e9bb67fc6849650a0a756bbb0b1690ce9a4ddca884
Deleted: sha256:bd0923edebaabd47c31d4f79115f9cbd91e6045c9b2585f02b346af81a6d3dbd
Deleted: sha256:0d6528f3488cda7f74d825579182af56cbdd7fed5bccacfa3042834b514157ac
Deleted: sha256:ec7d8444b0ff84cd1e55ec191abe60e26f996ac883d87dcb50fdca507f2af8be
Untagged: centos:latest
Untagged: centos@sha256:fe8d824220415eed5477b63addf40fb06c3b049404242b31982106ac204f6700
Deleted: sha256:470671670cac686c7cf0081e0b37da2e9f4f768ddc5f6a26102ccd1c6954c1ee
Deleted: sha256:0683de2821778aa9546bf3d3e6944df779daba1582631b7ea3517bb36f9e4007
Untagged: hello-world:latest
Untagged: hello-world@sha256:8e3114318a995a1ee497790535e7b88365222a21771ae7e53687ad76563e8e76
Deleted: sha256:bf756fb1ae65adf866bd8c456593cd24beb6a0a061dedf42b26a993176745f6b
Deleted: sha256:9c27e219663c25e0f28493790cc0b88bc973ba3b1686355f221c38a36978ac63
Error response from daemon: conflict: unable to delete 27e2331a77d7 (must be forced) - image is referenced in multiple repositories
Error response from daemon: conflict: unable to delete 27e2331a77d7 (must be forced) - image is referenced in multiple repositories
Error response from daemon: conflict: unable to delete 12b1fb2be42c (must be forced) - image is referenced in multiple repositories
Error response from daemon: conflict: unable to delete 12b1fb2be42c (must be forced) - image is referenced in multiple repositories
Error response from daemon: conflict: unable to delete 54b0995a6305 (cannot be forced) - image has dependent child images

$ docker image rmi -f $(docker images -q)
Untagged: exercise02:v2
Untagged: mrcsmonteiro/exercise02:v2
Untagged: mrcsmonteiro/exercise02@sha256:84b4bb4c993c028645870afa77cd23e83db77736c589dde17cd7b3b3427faebf
Deleted: sha256:27e2331a77d7e13c869d32ae70beaa7c40df3b38ed37f445412e8c67f0bf6a4b
Deleted: sha256:3f152d4ef7a010b0098cbfadada08dcb006abf4066bb807dbef54c4b45e8cdd7
Untagged: exercise02:v1
Untagged: mrcsmonteiro/exercise02:v1
Untagged: mrcsmonteiro/exercise02@sha256:d7ebc4eeaded7f0f8fdb7ac53ad90fafa552c94a5b66c35eb8d89e7404e96efa
Deleted: sha256:12b1fb2be42c7e93389cbba8cc7bdc18de821b486c6e5605af7c695711f19325
Deleted: sha256:0aaf101197990422d760a3c3743c533fd5a4b6f711c27141674bc25fd0e01a25
Untagged: httpd:2.4.41-alpine
Untagged: httpd@sha256:06ad90574c3a152ca91ba9417bb7a8f8b5757b44d232be12037d877e9f8f68ed
Deleted: sha256:54b0995a630527d5e8db6dfee1fedace23d145d7b916a455e0c8380db974d81c
Deleted: sha256:7cc2d2925b2b34f2dd686affc440499fa783c4ab357be56c5c49344dbd40d5ce
Deleted: sha256:72a14eca8a5cfa546ea7c391135969bf4a05ffa19518ff4441f66cadcc906fd9
Deleted: sha256:09427ece5b0c3fb84f7f65b61418e9a0cf31671722149b3d4688d29a61f8c0e4
Deleted: sha256:606838becbce6cc233c0d188ba9c137e32692aa75cedf12fda078512dfc8845c
Deleted: sha256:beee9f30bc1f711043e78d4a2be0668955d4b761d587d6f60c2c8dc081efb203
Error: No such image: 27e2331a77d7
Error: No such image: 12b1fb2be42c
```

- Command and it's output showing that there is no image or container on your local. Use only TEXT for the command output, don't include images (JPEG, PNG, etc):
```
$ docker container ls -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES

$ docker image ls -a
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE

$
```

***
Answer for exercise [c03-docker04](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker04/README.md)
