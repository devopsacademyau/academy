FROM python:3.10-slim-bullseye
WORKDIR /app

RUN apt-get update -y && apt-get install -y git
RUN git config --global user.email "dummy@devopsacademy.com" && \
    git config --global user.name "Dummy DA"
# ADD requirements.txt /app
COPY . /app

# RUN pip3 install -r requirements.txt

CMD [ "python", "./run.py"]