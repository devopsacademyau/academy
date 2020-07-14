
# C03-COMPOSE01

## Make
- [docker-compose.yaml](docker-compose.yaml)

## Command Execution Output

- Execution and output of the command `docker-compose ps`

```
ocker-compose ps
    Name                  Command               State          Ports        
----------------------------------------------------------------------------
devops_db_1    docker-entrypoint.sh mysqld      Up      3306/tcp, 33060/tcp 
devops_web_1   docker-php-entrypoint apac ...   Up      0.0.0.0:8100->80/tcp

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
