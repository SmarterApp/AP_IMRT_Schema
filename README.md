# AP_IMRT_Schema
Contains SQL schema migrations to support the IMRT application(s)

Uses the flyway gradle plugin: https://flywaydb.org/documentation/gradle/

Assumes that the database itself has already been created and configured

To use, configuir the following properties, either via environment variables, command line arguments, are gradle.properties:
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

## SQL Conventions

SQL files should conform to the following conventions:
* Use all lowercase letters for names
* Separate words using underscores
* Foreign key names should follow the format \<fk table>_\<fk column>
* Timestamp field names should end is _at, for example 'created_at'
* Timestamp columns should use the timestamptz type
* Columns denoting authorship should end in _by, for example 'updated_by'

## Migrations

* Migrations scripts should be added to the directory src/main/resources/db/migration
* Migration scripts should be named according to the flyway naming conventions definted here: 
https://flywaydb.org/documentation/migrations#naming
* The "Description" component of the file name should end with either '_ddl' (data definition language)
 or '_dml' (data manipulation languge), for example V1_imrt_ddl.sql  



