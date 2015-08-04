#!/bin/bash

if [ -f /etc/default/cyanite ]; then
    . /etc/default/cyanite
fi

cat /opt/cyanite/schema.cql | cqlsh cassandra

CYANITE_VERSION="0.5.1"

JAR="/opt/cyanite/cyanite-${CYANITE_VERSION}-standalone.jar"
CONFIG="/etc/cyanite.yaml"

EXTRA_JAVA_OPTS="-Xmx512m -Xms512m"

exec java $EXTRA_JAVA_OPTS $OPTS -jar "$JAR" -f "$CONFIG"
