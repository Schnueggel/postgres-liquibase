#!/bin/bash
echo "Setting up liquidbase"
: ${DB_ENV_POSTGRES_USER?"DB_ENV_POSTGRES_USER not set"}
: ${DB_ENV_POSTGRES_PASSWORD?"DB_ENV_POSTGRES_PASSWORD not set"}

cat <<CONF > /liquibase.properties
  driver: org.postgresql.Driver
  classpath: $POSTGRES_JDBC
  url: jdbc:postgresql://$DB_PORT_5432_TCP_ADDR:$DB_PORT_5432_TCP_PORT/$LB_DB_NAME
  username: $DB_ENV_POSTGRES_USER
  password: $DB_ENV_POSTGRES_PASSWORD
CONF
