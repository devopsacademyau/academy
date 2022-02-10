# C03-COMPOSE01

## Make
- [docker-compose.yaml](https://github.com/devopsacademyau/academy/blob/marshalldaniel/c03-compose01/classes/03class/exercises/c03-compose01/marshalldaniel/docker-compose.yaml)

## Command Execution Output

- Execution and output of the command `docker-compose ps`

```
docker-compose ps
NAME                  COMMAND                  SERVICE             STATUS              PORTS
c03-compose01-db-1    "docker-entrypoint.s…"   db                  running             33060/tcp
c03-compose01-web-1   "docker-php-entrypoi…"   web                 running             0.0.0.0:8100->80/tcp
```

- Execution and output of the command `curl http://localhost:8100`

```
curl http://localhost:8100


Connected Successfully%
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-compose01](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-compose01/README.md)