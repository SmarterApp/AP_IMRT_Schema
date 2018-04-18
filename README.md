# AP_IMRT_Schema
Contains SQL schema migrations to support the IMRT application(s). Uses the [flyway gradle plugin](https://flywaydb.org/documentation/gradle/).

Prior to creating the schema, the databases and users must be created.  The steps below will walk through creating the following databases:

* `imrt`
* `test`

The following user accounts will be created:

* `imrt_admin`
* `imrt_ingest`
* `imrt_search`
* `test`

## Create the `imrt` and `test` Databases
Connect into PostgreSQL using the psql command line tool. You will need to initially connect using the `postgres` user, password is whatever you set it to during the install.

Once you connect, create an administration-level user.  This user will be used to create the `imrt` and `test` databases.  You can set the passwords to whatever you like:

```
$ psql -U postgres
postgres=# CREATE ROLE "imrt_admin" with LOGIN SUPERUSER CREATEDB CREATEROLE PASSWORD '[choose a password]';
postgres=# \q
```

After creating the administration-level user, log into postgres with that account:

```
psql -U imrt_admin postgres
postgres=# CREATE DATABASE "imrt";
postgres=# CREATE DATABASE "test";
postgres=# \q
```

## Create `imrt_ingest` and `imrt_search` Users For the `imrt` Database
The following SQL can be used to create the `imrt_ingest` and `imrt_search` users in the `imrt` database with the correct permissions:

```sql
CREATE USER imrt_ingest WITH PASSWORD '[choose a password]';
CREATE USER imrt_search WITH PASSWORD '[choose a password]';

GRANT CONNECT ON DATABASE imrt TO imrt_ingest;
GRANT CONNECT ON DATABASE imrt TO imrt_search;

REVOKE ALL ON ALL TABLES IN SCHEMA public FROM PUBLIC;

GRANT ALL ON ALL TABLES IN SCHEMA public TO imrt_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO imrt_ingest;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO imrt_search;

GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO imrt_admin;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO imrt_ingest;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO imrt_search;

ALTER DEFAULT PRIVILEGES
    FOR ROLE imrt_admin
    IN SCHEMA public
    GRANT ALL ON TABLES TO imrt_admin;

ALTER DEFAULT PRIVILEGES
    FOR ROLE imrt_ingest
    IN SCHEMA public
    GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO imrt_ingest;

ALTER DEFAULT PRIVILEGES
    IN SCHEMA public
    GRANT USAGE, SELECT ON SEQUENCES TO imrt_admin;

ALTER DEFAULT PRIVILEGES
    IN SCHEMA public
    GRANT USAGE, SELECT ON SEQUENCES TO imrt_ingest;

ALTER DEFAULT PRIVILEGES
    FOR ROLE imrt_search
    IN SCHEMA public
    GRANT SELECT ON TABLES To imrt_search;

ALTER DEFAULT PRIVILEGES
    IN SCHEMA public
    GRANT SELECT ON SEQUENCES TO imrt_search;
```

## Create the `test` User For the `test` Database
The following SQL can be used to create the `test` user for the `test` database (which is used by the Gradle build process
to run integration tests).  Unlike the `imrt_ingest` and `imrt_search` users, the `test` user will have sufficient privileges
to create/modify the schema and conduct the integration tests.

```sql
CREATE USER test WITH PASSWORD '[choose a password]';

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO test;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO test;

ALTER DEFAULT PRIVILEGES
    FOR ROLE test
    IN SCHEMA public
    GRANT ALL ON TABLES TO test;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
    GRANT USAGE, SELECT ON SEQUENCES TO test;
```

## Run Database Migrations to Create Database Objects
After the databases and users have been created, the Flyway migrations need to be run against the `imrt` and `test` databases.  To create the `imrt` and/or `test` database objects, configure the following properties via one of the following:

* environment variables
* command line arguments
* `gradle.properties`:

<pre>
flyway.user=<user>
flyway.password=<password>
flyway.url=<url>
Sample URL for local database named imrt: jdbc:postgresql://localhost:5432/imrt
</pre>

Then run the flyway tasks, for example:
<pre>
./gradlew flywayClean
./gradlew flywayMigrate
</pre>

### Executable Jar
In addition to using the Gradle plugin, this project creates an executable jar that can be used to run migrations.  You will need to pass in the necessary JDBC url and user credental information.

To build the executable jar (in the root of the project):

```
gradle build -i
```

An example command to run the jar against the `imrt` database: (in the root of the project):

```
 java -jar build/libs/AP_IMRT_Schema.jar --spring.datasource.url="jdbc:postgresql://localhost:5432/imrt" --spring.datasource.username="<user>" --spring.datasource.password="<password>"
```

## SQL Conventions

SQL files should conform to the following conventions:
* Use all lowercase letters for names
* Separate words using underscores
* Foreign key names should follow the format \<fk table>_\<fk column>
* Timestamp field names should end is _at, for example 'created_at'
* Timestamp columns should use the timestamptz type
* Columns denoting authorship should end in _by, for example 'updated_by'
* Each table should contain created_at, updated_at, and updated_by audit fields.

## Migrations

* Migrations scripts should be added to the directory `src/main/resources/db/migration`
* Migration scripts should be named according to the flyway naming conventions definted here:
https://flywaydb.org/documentation/migrations#naming
* The "Description" component of the file name should end with either '_ddl' (data definition language)
 or '_dml' (data manipulation languge), for example `V1_imrt_ddl.sql`



