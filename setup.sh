#!/bin/bash

# make sure that ALL databases are available
# exit on error
set -e
for DATABASE_DUMP in $POSTGRES_SETUP; do
  HOST=$(echo "$DATABASE_DUMP" | cut -d '/' -f 1)
  echo "[INFO] check availability of host $HOST"

  psql --host "${DEPLOYMENT_NAME:+${DEPLOYMENT_NAME}-}${HOST}-db" \
    --username "postgres" --file "postgres/health-check.sql" postgres > /dev/null
done

echo "[INFO] all databases are available"

# setup databases
# do not abort on error
set +e
for DATABASE_DUMP in $POSTGRES_SETUP; do
  HOST=$(echo "$DATABASE_DUMP" | cut -d '/' -f 1)
  echo "[INFO] initialize host $HOST with $DATABASE_DUMP"

  psql --host "${DEPLOYMENT_NAME:+${DEPLOYMENT_NAME}-}${HOST}-db" \
    --username "postgres" --file "postgres/$DATABASE_DUMP" postgres
done

echo "finishSetup"
