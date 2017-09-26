FROM maven:3.5-jdk-7
MAINTAINER DUONG Dinh Cuong <cuong3ihut@gmail.com>

ENV TAG_VERSION 0.0.0

RUN apt-get update && apt-get install -y git \
    && git clone https://github.com/confluentinc/ksql.git /opt/ksql \
    && cd /opt/ksql \
    && mvn clean compile install -DskipTests \
    && rm -rf /var/lib/apt/lists/*


WORKDIR "/opt/ksql/"

EXPOSE 8080

CMD ["bin/ksql-server-start","/opt/ksql/config/ksqlserver.properties"]