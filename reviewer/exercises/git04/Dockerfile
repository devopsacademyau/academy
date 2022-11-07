FROM python:3.10-slim-bullseye
WORKDIR /app

ADD requirements.txt /app
ADD review.py /app

RUN pip3 install -r requirements.txt

CMD [ "python", "./review.py"]