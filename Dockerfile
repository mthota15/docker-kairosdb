FROM java:8-alpine

RUN apk upgrade libssl1.0 --update-cache && \
    apk add wget ca-certificates bash

RUN mkdir -p /opt && \
    wget -qO- https://github.com/kairosdb/kairosdb/releases/download/v1.2.1/kairosdb-1.2.1-1.tar.gz | tar xvz -C /opt
    
COPY logback.xml /opt/kairosdb/conf/logging

EXPOSE 8080
CMD ["/opt/kairosdb/bin/kairosdb.sh", "run"]
