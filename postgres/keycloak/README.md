## Keycloak database configurations

## default.sql

> **Important:** This dump contains hard-coded `http://localhost` URLs and is therefore only usable for local development.

### Realms
| Realm     | Description                                    |
|-----------|------------------------------------------------|
| Master    | Realm for managing users and Keycloak settings |
| Gamify-IT | Realm for our game                             |

### Users
| Realm     | Name    | Password | Description                                                        |
|-----------|---------|----------|--------------------------------------------------------------------|
| Keycloak  | admin   | admin    | Main admin user for Keycloak, can be used to create new users.     |
| Gamify-IT | student | student  | Test account when logging in as a student.                         |
| Gamify-IT | max     | max      | A second student test account for demonstration and test purposes. |
