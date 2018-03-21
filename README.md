# AP_IMRT_Schema
Contains SQL schema migrations to support the IMRT application(s). Uses the [flyway gradle plugin](https://flywaydb.org/documentation/gradle/).

Assumes that the database itself has already been created and configured.  At a minimum you will need the following users created:

* `imrt_ingest`
* `imrt_search`

To use, configure the following properties, either via environment variables, command line arguments, are gradle.properties:
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

## Executable Jar
In addition to using the Gradle plugin the project creates an executable jar that can be used to run migrations.  You will need to pass in the necessary JDBC url and user credental information.

An example command to run the jar:

```
 java -jar build/libs/AP_IMRT_Schema.jar --spring.datasource.url="jdbc:postgresql://localhost:5432/imrt" --spring.datasource.username:"<user>" --spring.datasource.password="<password>"
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

* Migrations scripts should be added to the directory src/main/resources/db/migration
* Migration scripts should be named according to the flyway naming conventions definted here: 
https://flywaydb.org/documentation/migrations#naming
* The "Description" component of the file name should end with either '_ddl' (data definition language)
 or '_dml' (data manipulation languge), for example V1_imrt_ddl.sql  



