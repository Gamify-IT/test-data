#!/bin/bash

for DATABASE_DUMP in $POSTGRES_SETUP; do
  echo "Setup database: $DATABASE_DUMP"
  HOST=$(echo "$DATABASE_DUMP" | cut -d '/' -f 1)

  psql --host "$HOST-db" --username "postgres" --file "postgres/$DATABASE_DUMP"
done
