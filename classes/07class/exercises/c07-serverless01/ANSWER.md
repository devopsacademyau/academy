# c07-serverless02

## Uploading profile images and notifying 

- [terraform/_provider.tf](terraform/_provider.tf)
- [`terraform/main.yaml`](terraform/main.yaml): terraform code for all resources
- [`src/photo_handler.py`](src/): Lambda for handling S3 event (the lambda DOES NOT need to be Python, you can use other languages)
- [`src/report_customers_count.py`](src/): Lambda for consuming from DDB stream and calling SNS (the lambda DOES NOT need to be Python, you can use other languages)
- [`docker-compose.yaml`](docker-compose.yaml): part of 3M 
- [`Makefile`](Makefile): 3 Musketeers implementation
- [docker-compose.yaml](docker-compose.yaml): part of 3M implementation

> Solution might contain other files than the ones listed above.

## Comments and Challenges faced

> List here any challenges faced and how you solved them


<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c07-serverless02](https://github.com/devopsacademyau/academy/blob/b06b4cc323b9349d904562e45551c22974928952/classes/07class/exercises/c07-serverless01/README.md)
