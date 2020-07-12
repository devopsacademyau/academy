# C03-COMPOSE01

## Make
- [docker-compose.yaml](docker-compose.yaml)
- [.web.env](.web.env)
- [.db.env](.db.env)


## Command Execution Output

- Execution and output of the command `docker-compose ps`

```
docker-compose ps
WARNING: Some services (db, web) use the 'deploy' key, which will be ignored. Compose does not support 'deploy' configuration - use `docker stack deploy` to deploy to a swarm.
   Name                  Command               State                 Ports
----------------------------------------------------------------------------------------
frdvo_db_1    docker-entrypoint.sh mysqld      Up      0.0.0.0:3306->3306/tcp, 33060/tcp
frdvo_web_1   docker-php-entrypoint apac ...   Up      0.0.0.0:8100->80/tcp
```

- Execution and output of the command `curl http://localhost:8100`

```
curl http://localhost:8100


Connected Successfully
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-compose01](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-compose01/README.md)