# C03-Docker04


## Command Execution Output
- Commands executed to clean up both the images and the containers(running or exited) from your local:
```
>List all the containers by IDs
$ docker ps -aq
d47ef7b23f01
658fdc197ca8
2a7c2a75e1e6

> Stop all running containers
$ docker stop $(docker ps -aq)
d47ef7b23f01
658fdc197ca8
2a7c2a75e1e6

>Remove all docker containers
$ docker rm $(docker ps -aq)
d47ef7b23f01
658fdc197ca8
2a7c2a75e1e6

>List all the images by IDs
$ docker images -aq
f7f04bbc5d00
8b521ef511ff
8b521ef511ff
6b8722ae61a1

>Remove all images
$ docker rmi $(docker images -aq)
Deleted: sha256:6b8722ae61a14aec3fba30b7dd1d3811927e4cdf24da5d3b022412e4d6868c37
Deleted: sha256:e582411c3bd87d418035394d7e08770fc16dae0b08917668c033edd0484804c1
Untagged: da-terraform:c03-docker-e01
Deleted: sha256:483bce4d00f88a5277cf26e6e9d58eb3b417fb08cf6c40a690e1c4301012dc53
Deleted: sha256:f9e1f1cb3e1093f39199d336d30cae19e4cd9ca1cc8a58aa1e9bcc21615c5781
Deleted: sha256:deee5ffb867c2379c1105c1fe7b3422c299c249ce57be9598217818b02681f53
Deleted: sha256:ce20bbcdf864d90bebecb1368af64ddf0f5771317814d91aa41147168b7b7138
Deleted: sha256:4bb3edb1547055792e2de0822ffd3e7d7daed54da1c0fb3491617c46a972004d
Deleted: sha256:50dc74027789f5d2197b98a0aba34e99c74a9ef906d5aa233247866110874d39
Deleted: sha256:1f6be6ef4f70ba982a7be7c585679f0be6fb650d27565b99c0fd55d35707f27e
Deleted: sha256:14fbaeb64ed758d7d655027fecc22394b657688218a737b75bd4beaa6bf780ac
Deleted: sha256:74d7711545c4c3c17999c55f85b188dda2ec0a36cbeafdb1358be713aee2b2b0
Untagged: nimmi89_web:latest
Deleted: sha256:405905049c43ef0e0ec069bdce2d7c8f5ba9f4273a4e4d47e76886894fc35755
Deleted: sha256:1fb0aa2309095fdc7339003a1a24eaa1019bd9556c0b66d61a4bb7ba89c7c431
Deleted: sha256:b05a6f4dff5eeb2b14641358db72f101845d087dac6f5c8d8f35b73bd2b50cb4
Deleted: sha256:8206cba49af2b7becc7b6e473f6f946e5e03fb28f26a8dbcbeb012e30269b544
Deleted: sha256:6c1d27458474b20ca564d2574093192ef51b508954f58e3e2bf64f5c3fc71917
Deleted: sha256:1b12c4ab3a297ae96d477a1f10fc6fcf4b65050dc53f1aad8fda23a5d22e8e13
Untagged: php:7.4-apache
Untagged: php@sha256:926b2a41d523188cfc0189fc9bfae4ddeb82a4f53a3d30ff9353726b84968a49
Deleted: sha256:0cc0bf2d60081ac8982aeb8f15ebd2832a8321ff4042b141e0cfa09b2ecaf2c2
Deleted: sha256:541dd375a87cc0a4904227bdd1c7d1f3c471dd02a0120ce8f725325da9d0b04f
Deleted: sha256:1cb1b5a5e22437216f4522f01d6eb174008e9397e92239a38a01d0f7fddb61c7
Deleted: sha256:6e6e25db567b59ce660a3c942f8362b72fe4718260e62622215e8da00d9fc48b
Deleted: sha256:3a5c618250b47d2bdf2ded78c3f3662787ad5c3d79264ab6ded19b3b9dfc9491
Deleted: sha256:10876f8ba4b79f601f5e621b2d676555918e74b2d16849e4623d4e752c0ab69a
Deleted: sha256:09e9a39d69273376c8645bbd66c5fb4737b39b3bfa7531fb2163313559d3f880
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

>Remove all unused containers, networks, images (both dangling and unreferenced), and optionally, volumes.
docker system prune  

>To remove images having multiple repositories, just remove the repository/tag and then remove image.

```

- Command and it's output showing that there is no image or container on your local. Use only TEXT for the command output, don't include images (JPEG, PNG, etc):
```
$ docker images -a
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS
NAMES

```


***
Answer for exercise [c03-docker04](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker04/README.md)
