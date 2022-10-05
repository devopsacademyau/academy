FROM python:3
# RUN python3 review.py

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
# RUN pip3 install gspread numpy pandas matplotlib
# RUN apt-get update -y
# RUN apt-get install -y jq
