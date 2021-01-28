FROM python:3.6-alpine

WORKDIR /opt
ENTRYPOINT ["./anonymize.sh"]

COPY requirements.txt ./
RUN pip --no-cache-dir --disable-pip-version-check install -r requirements.txt

RUN apk add --no-cache mysql-client postgresql-client

COPY . ./