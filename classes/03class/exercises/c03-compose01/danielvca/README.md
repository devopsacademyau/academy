
# C03-COMPOSE01

## Make
- [docker-compose.yaml](docker-compose.yaml)

## Command Execution Output

- Execution and output of the command `docker-compose ps`

```
CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS NAMES  
7fcb9be870ba devacademy_web "docker-php-entrypoi…" 5 minutes ago Up 5 minutes 0.0.0.0:8100->80/tcp devacademy_web_1  
c0fbb1778d39 mysql:5.7 "docker-entrypoint.s…" 5 minutes ago Up 5 minutes 3306/tcp, 33060/tcp devacademy_db_1
```

- Execution and output of the command `curl http://localhost:8100`

```
❯ curl http://localhost:8100  
Connected Successfully%
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-compose01](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-compose01/README.md)

> Written with [StackEdit](https://stackedit.io/).
