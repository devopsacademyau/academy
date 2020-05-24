# Run wordpress
This provides a good example start to test run wordpress locally from wordpress image.

## How to

Make sure you have installed [docker-compose](https://docs.docker.com/compose/install/) in your local machine.

Then run in this example directory run
```docker-compose up```

and it will pull and run a wordpress image and a mysql image, after a few seconds, you can access 
```localhost:8000``` to setup your local wordpress website

## Volume

Within docker-compose.yaml, tt's worth to noting the **volumes** attribute for db and wordpress service.
```
 volumes:
       - ./db_data:/var/lib/mysql:rw      
```
and
```
  volumes: 
       - ./wordpress:/var/www/html:rw
```

What them do is mount a container path(**/var/lib/mysql** for db,**/var/www/html** for wordpress) to your local machine, so after you delete your container, the data will be saved.

After the website up and running, you will see there are two folders created within this **example** folder, one is **db_data** and another **wordpress**, try to make some changes to the wordpress, for example, add one more theme, and you will see one more theme folder shows within **wordpress/wp-content/themes**

There are three types of volumes in docker.
- Host volumes
- Anonymous volumes
- Named volumes

What we used in this docker-compose.yml is host volumes.



