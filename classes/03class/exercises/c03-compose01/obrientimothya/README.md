# C03-COMPOSE01

## Make
- [docker-compose.yaml](docker-compose.yaml)

## Command Execution Output

- Execution and output of the command `docker-compose ps`

```
$ export DB_USER=dbuser
$ export DB_PASS=dbpass
$ export DB_HOST=db
$ export DB=db
$ export MYSQL_ROOT_PASSWORD=rootpass
$ export MYSQL_DATABASE=db
$ export MYSQL_USER=dbuser
$ export MYSQL_PASSWORD=dbpass

$ docker-compose up

...snip...
db_1   | 2020-08-04T09:29:54.395403Z 0 [Note] Event Scheduler: Loaded 0 events
db_1   | 2020-08-04T09:29:54.396857Z 0 [Note] mysqld: ready for connections.
db_1   | Version: '5.7.31'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server (GPL)
web_1  | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.24.0.3. Set the 'ServerName' directive globally to suppress this message
web_1  | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.24.0.3. Set the 'ServerName' directive globally to suppress this message
web_1  | [Tue Aug 04 09:29:54.510031 2020] [mpm_prefork:notice] [pid 1] AH00163: Apache/2.4.38 (Debian) PHP/7.4.8 configured -- resuming normal operations
web_1  | [Tue Aug 04 09:29:54.510305 2020] [core:notice] [pid 1] AH00094: Command line: 'apache2 -D FOREGROUND'
web_1  | 172.24.0.1 - - [04/Aug/2020:09:30:01 +0000] "GET / HTTP/1.1" 200 253 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105

$ docker-compose ps

        Name                      Command               State                 Ports
-------------------------------------------------------------------------------------------------
obrientimothya_db_1    docker-entrypoint.sh mysqld      Up      0.0.0.0:3306->3306/tcp, 33060/tcp
obrientimothya_web_1   docker-php-entrypoint apac ...   Up      0.0.0.0:8100->80/tcp
```

- Execution and output of the command `curl http://localhost:8100`

```
Connected Successfully
```

***
Answer for exercise [c03-compose01](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-compose01/README.md)
