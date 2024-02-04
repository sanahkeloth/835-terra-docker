FROM ubuntu:20.04

RUN apt-get update -y && apt-get install -y \
    python3-pip \
    mysql-client \
    iputils-ping \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

EXPOSE 8080

ENTRYPOINT [ "python3" ]
CMD [ "app.py" ]
