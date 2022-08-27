FROM ubuntu:16.04

# Keeps Python from generating .pyc files in the container
ENV PORT 8080

# Turns off buffering for easier container logging
ENV HOST 0.0.0.0

EXPOSE 8080

RUN apt-get update -y && \
    apt-get install -y python3-pip

# Install pip requirements
COPY requirements.txt /app/requirements.txt

WORKDIR ./app

RUN pip3 install -r requirements.txt

COPY . /app

ENTRYPOINT [ "python3" ]

CMD [ "app.py" ]
