# C03-COMPOSE01

## Make
- [docker-compose.yaml](docker-compose.yaml)

## Command Execution Output

- Execution and output of the command `docker-compose ps`

```
ravi.senevirathne@contino.io@Ravis-MacBook-Pro ravisenevirathne % docker-compose ps
NAME                COMMAND                  SERVICE             STATUS              PORTS
Web                 "docker-php-entrypoi…"   web_service         running             0.0.0.0:8100->80/tcp
db                  "docker-entrypoint.s…"   database_service    running             0.0.0.0:3306->3306/tcp
```

- Execution and output of the command `curl http://localhost:8100`

```
ravi.senevirathne@contino.io@Ravis-MacBook-Pro ravisenevirathne % curl http://localhost:8100

<br />
<b>Warning</b>:  mysqli::__construct(): php_network_getaddresses: getaddrinfo failed: Name or service not known in <b>/var/www/html/db_connector.php</b> on line <b>9</b><br />
<br />
<b>Warning</b>:  mysqli::__construct(): (HY000/2002): php_network_getaddresses: getaddrinfo failed: Name or service not known in <b>/var/www/html/db_connector.php</b> on line <b>9</b><br />
Connected Successfully<br />
<b>Warning</b>:  mysqli::close(): Couldn't fetch mysqli in <b>/var/www/html/db_connector.php</b> on line <b>16</b><br />
```
## REF - https://www.section.io/engineering-education/dockerized-php-apache-and-mysql-container-development-environment/

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-compose01](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-compose01/README.md)