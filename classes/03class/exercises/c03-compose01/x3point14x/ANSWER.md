# C03-COMPOSE01

## Make
- [docker-compose.yaml](docker-compose.yaml)

## Command Execution Output

- Execution and output of the command `docker-compose ps`

```
❯ docker-compose ps
NAME                COMMAND                  SERVICE             STATUS              PORTS
db                  "docker-entrypoint.s…"   db                  running             33060/tcp
web                 "docker-php-entrypoi…"   web                 running             0.0.0.0:8100->80/tcp, :::8100->80/tcp
```

- Execution and output of the command `curl http://localhost:8100`

```
❯ curl http://localhost:8100


Connected Successfully%
```

***
Answer for exercise [c03-compose01](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-compose01/README.md)