FROM python:3
RUN pip3 install gspread numpy pandas matplotlib
RUN apt-get update -y
RUN apt-get install -y jq
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install