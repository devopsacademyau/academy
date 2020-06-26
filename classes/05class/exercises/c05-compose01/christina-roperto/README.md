# C05-COMPOSE01

## Make
- [docker-compose.yaml](docker-compose.yaml)

## Command Execution Output

- Execution and output of the command `docker-compose ps`

```
         Name                        Command               State                 Ports
----------------------------------------------------------------------------------------------------
christina-roperto_db_1    docker-entrypoint.sh mysqld      Up      0.0.0.0:3306->3306/tcp, 33060/tcp
christina-roperto_web_1   docker-php-entrypoint apac ...   Up      0.0.0.0:8100->80/tcp
```

- Execution and output of the command `curl http://localhost:8100`

```


Connected Successfully%
```


***
Answer for exercise [c05-compose01](https://github.com/devopsacademyau/academy/blob/c41e824fb2a2c55e3a30b2371a87e3a7551b6741/classes/05class/exercises/c05-compose01/README.md)