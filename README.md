# Test data

## PostgreSQL

Test data for PostgreSQL is stored as SQL dumps in the `postgres` directory.

### Creating a database dump

SQL dumps are files containing the SQL to restore a specific database state.

You can create a database dump by running the following command (replace overworld with the name of the database you want to dump):

```bash
docker exec overworld-db pg_dump --username postgres postgres > overworld_dump.sql
```

The output is in the `overworld_dump.sql` file in the current working directory.

### Container usage

In the docker-compose files there is always a section similar to this:

```yaml
  setup:
    container_name: setup
    image: ghcr.io/gamify-it/test-data:latest
    pull_policy: always
    restart: on-failure
    environment:
      DEPLOYMENT_NAME: dev
      POSTGRES_SETUP: >
        overworld/default.sql
        chickenshock/default.sql
```

This configuration inserts the default dataset for the `overworld` and `chickenshock` into their database containers.
You can change the filenames to load different datasets.
The files are located in `postgres/` in this repository.
