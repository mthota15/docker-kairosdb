FROM java:8-alpine

RUN apk upgrade libssl1.0 --update-cache && \
    apk add wget ca-certificates bash

RUN mkdir -p /opt && \
    wget -qO- https://github.com/kairosdb/kairosdb/releases/download/v1.2.0-beta3/kairosdb-1.2.0-0.3beta.tar.gz | tar xvz -C /opt

COPY logback.xml /opt/kairosdb/conf/logging

EXPOSE 8080
CMD ["/opt/kairosdb/bin/kairosdb.sh", "run"]
