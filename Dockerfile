FROM alpine

RUN apk add --no-cache postgresql-client bash

WORKDIR /app

# ultra secret postgres credentials
COPY postgres/.pgpass /root/.pgpass
RUN chmod 0600 /root/.pgpass

COPY setup.sh ./
RUN chmod +x setup.sh
COPY postgres ./postgres
ENV DEPLOYMENT_NAME=""


CMD ["./setup.sh"]
