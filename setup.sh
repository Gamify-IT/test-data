#!/bin/bash

# make sure that ALL databases are available
# exit on error
set -e
for DATABASE_DUMP in $POSTGRES_SETUP; do
  HOST=$(echo "$DATABASE_DUMP" | cut -d '/' -f 1)
  echo "check availability of host $HOST"

  psql --host "$HOST-db" --username "postgres" --file "postgres/health-check.sql" > /dev/null
done

# setup databases
# do not abort on error
set +e
for DATABASE_DUMP in $POSTGRES_SETUP; do
  HOST=$(echo "$DATABASE_DUMP" | cut -d '/' -f 1)
  echo "initialize host $HOST with $DATABASE_DUMP"

  psql --host "$HOST-db" --username "postgres" --file "postgres/$DATABASE_DUMP"
done
