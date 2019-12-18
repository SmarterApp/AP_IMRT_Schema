# Initial Setup

[Go Back](../README.md)

IMRT relies on POSTGRES 9.6.  To run this locally you will need Postgres running.  The commands listed in this document are needed for initial setup of the database.  Steps to run the migrations themselves can be found [here](migrations.md)

## Database and Users
Prior to creating the schema, the databases and users must be created.  The steps below will walk through creating the following databases:

* `imrt`

The following user accounts will be created:

* `imrt_admin`
* `imrt_ingest`
* `imrt_search`

### Create the `imrt` and `test` Databases
Connect into PostgreSQL using the psql command line tool. You will need to initially connect using the `postgres` user, password is whatever you set it to during the install.

Once you connect, create an administration-level user.  This user will be used to create the `imrt` and `test` databases.  You can set the passwords to whatever you like.

#### Creating the Administration-Level User in Postgres

```
$ psql -U postgres
postgres=# CREATE ROLE "imrt_admin" with LOGIN SUPERUSER CREATEDB CREATEROLE PASSWORD '[choose a password]';
postgres=# \q
```

#### Creating the Administration-Level User in AWS RDS
In an AWS RDS instance, a `SUPERUSER`-level user cannot be created.  When using an RDS instance, you can:

* Use the "master" account (the account defined while standing up the instance).  This account has sufficient privileges for following the remaining steps
* Use the following SQL to create a new user account with privileges to create users and databases:
  * replace `[user account name]` with a meaningful account name
  * replace `[choose a password]` with a meaningful password

```sql
CREATE ROLE "[user account name]" with LOGIN CREATEDB CREATEROLE PASSWORD '[choose a password]'
```

After creating the administration-level user, log into postgres with that account:

```
psql -U imrt_admin postgres
postgres=# CREATE DATABASE "imrt";
postgres=# \q
```

### Create `imrt_ingest` and `imrt_search` Users For the `imrt` Database
The following SQL can be used to create the `imrt_ingest` and `imrt_search` users in the `imrt` database with the correct permissions:


Make sure you are logged in as imrt_admin and are using the imrt database before running the sql commands.
```
psql -U imrt_admin imrt
```

```sql
CREATE ROLE imrt_ingest LOGIN PASSWORD '[choose a password]';
CREATE ROLE imrt_search LOGIN PASSWORD '[choose a password]';

GRANT CONNECT ON DATABASE imrt TO imrt_ingest;
GRANT CONNECT ON DATABASE imrt TO imrt_search;

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
    IN SCHEMA public
    GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO imrt_ingest;

ALTER DEFAULT PRIVILEGES
    IN SCHEMA public
    GRANT USAGE, SELECT ON SEQUENCES TO imrt_admin;

ALTER DEFAULT PRIVILEGES
    IN SCHEMA public
    GRANT USAGE, SELECT ON SEQUENCES TO imrt_ingest;

ALTER DEFAULT PRIVILEGES
    IN SCHEMA public
    GRANT SELECT ON TABLES To imrt_search;

ALTER DEFAULT PRIVILEGES
    IN SCHEMA public
    GRANT SELECT ON SEQUENCES TO imrt_search;
```

## Local Development test database 
> **NOTE:** This step is only required for setting up a new developer's workstation or a build server.  For system deployment (e.g. deploying IMRT to a development or production environment), this step can be skipped.  There is no need to create a `test` database when deploying to an environment.

The following SQL can be used to create the `test` user for the `test` database (which is used by the Gradle build process
to run integration tests).  Unlike the `imrt_ingest` and `imrt_search` users, the `test` user will have sufficient privileges
to create/modify the schema and conduct the integration tests.

1. Create the test database.
<pre>
psql -U imrt_admin postgres
postgres=# CREATE DATABASE "test";
postgres=# \q
</pre>

1. Grant the test user a cess  to test database.

Make sure you are logged in as imrt_admin and are using the test database before running the sql commands.
```
psql -U imrt_admin test
```

```sql
CREATE USER test WITH PASSWORD '[choose a password]';

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO test;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO test;

ALTER DEFAULT PRIVILEGES
    IN SCHEMA public
    GRANT ALL ON TABLES TO test;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
    GRANT USAGE, SELECT ON SEQUENCES TO test;
```
