# C03-COMPOSE01

## Make

- [docker-compose.yaml](docker-compose.yaml)

## Command Execution Output

- Execution and output of the command `docker-compose ps`

```bash
## Command
docker-compose ps
# Output
     Name                 Command             State             Ports
--------------------------------------------------------------------------------
gpavelar_db_1    docker-entrypoint.sh         Up      0.0.0.0:3306->3306/tcp,
                 mysqld                               33060/tcp
gpavelar_web_1   docker-php-entrypoint apac   Up      0.0.0.0:8100->80/tcp
                 ...

```

- Execution and output of the command `curl http://localhost:8100`

```bash
## Command
gpavelar/c03-compose01  curl http://localhost:8100
# Output



Connected Successfully%
```

### Challenges

- Should I define `--volume` to the db service too? What would be the question to use volume in my db service?

---

Answer for exercise [c03-compose01](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-compose01/README.md)
