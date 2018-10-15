# AP\_IMRT_Schema
Contains SQL schema migrations to support the IMRT application(s). Uses the [flyway gradle plugin](https://flywaydb.org/documentation/gradle/).

## Documentation

* [IMRT Schema Document](imrt_schema_document.md)
* [Initial Setup](initial_setup.md)
* [Run Datbase](migrations.md)

## Common Tasks
* [Create Read-Only Logins](create_read_only_logins.md)

## Developer Notes
This section covers conventions for adding SQL migrations to the project.

### SQL Conventions

SQL files should conform to the following conventions:
* Use all lowercase letters for names
* Separate words using underscores
* Foreign key names should follow the format \<fk table>_\<fk column>
* Timestamp field names should end is _at, for example 'created_at'
* Timestamp columns should use the timestamptz type
* Columns denoting authorship should end in _by, for example 'updated_by'
* Each table should contain created_at, updated_at, and updated_by audit fields.

### Migrations

* Migrations scripts should be added to the directory `src/main/resources/db/migration`
* Migration scripts should be named according to the flyway naming conventions defined here:
https://flywaydb.org/documentation/migrations#naming
* The "Description" component of the file name should end with either '_ddl' (data definition language)
 or '_dml' (data manipulation language), for example `V1_imrt_ddl.sql`



