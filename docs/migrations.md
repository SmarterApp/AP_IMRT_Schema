# DB Migrations

[Go Back](../README.md)

IMRT uses [Flyway](https://flywaydb.org/documentation/) for database migrations.  This can be executed two ways:

* Run flyway directly leveraging Gradle
* Use the executable JAR to run flyway

Both sections are described in this document.  Every IMRT release will tag and release an executable JAR with the tag so that deployers do not need to run Gradle directly.  However, both ways will work and produce the same results.

## Use Flyway directly leveraging Gradle
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

# Use IMRT Schema Executable Jar
In addition to using the Gradle plugin, this project creates an executable jar that can be used to run migrations.  You will need to pass in the necessary JDBC url and user credential information.

To build the executable jar (in the root of the project):

```
gradle build -i
```

An example command to run the jar against the `imrt` database: 

```
 java -jar <location of jar>/AP_IMRT_Schema.jar --spring.datasource.url="jdbc:postgresql://localhost:5432/imrt" --spring.datasource.username="<user>" --spring.datasource.password="<password>"
```

The above command will need the following provided:

* location of jar
	* This will be wherever you downloaded it or if you built the project it will be in the `build/libs` directory named `AP_IMRT_Schema.jar`. 
* `spring.datasource.url`
	* 	This is the DB url.  The example above has localhost.  Note that we provide the port and the base schema in the url.  For example, connecting to AWS Postgres you'd provide `jdbc:postgresql:AWS_DB_ID:5432/imrt` replacing `AWS_DB_ID` with the AWS endpoint id for the database.
*  `spring.datasource.username` 
	*  This should be the imrt_admin type user that has the ability to create, drop, and alter databases.
*  `spring.datasource.password` 
	*  The db user's password from the previous step

## Schema Verification
To verify the `imrt` schema has been created, connect to the `imrt` database on the server and run the `\dt` command to view the tables in `imrt`.  An example is shown below (be sure to substitute `imrt-db.example.com` with the appropriate host name):

```
psql -h imrt-db.example.com -U imrt_admin imrt
Password for user imrt_admin:
psql (10.3, server 9.6.6)
SSL connection (protocol: TLSv1.2, cipher: ECDHE-RSA-AES256-GCM-SHA384, bits: 256, compression: off)
Type "help" for help.

imrt=# \d
                         List of relations
 Schema |               Name               |   Type   |   Owner
--------+----------------------------------+----------+------------
 public | batch_job_execution              | table    | imrt_admin
 public | batch_job_execution_context      | table    | imrt_admin
 public | batch_job_execution_params       | table    | imrt_admin
 public | batch_job_execution_seq          | sequence | imrt_admin
 public | batch_job_instance               | table    | imrt_admin
 public | batch_job_seq                    | sequence | imrt_admin
 public | batch_step_execution             | table    | imrt_admin
 public | batch_step_execution_context     | table    | imrt_admin
 public | batch_step_execution_seq         | sequence | imrt_admin
 public | flyway_schema_history            | table    | imrt_admin
 public | item                             | table    | imrt_admin
 public | item_attachment                  | table    | imrt_admin
 public | item_content_update_need         | table    | imrt_admin
 public | item_content_update_need_key_seq | sequence | imrt_admin
 public | item_form                        | table    | imrt_admin
 public | item_form_key_seq                | sequence | imrt_admin
 public | item_git                         | table    | imrt_admin
 public | item_key_seq                     | sequence | imrt_admin
 public | item_log                         | table    | imrt_admin
 public | project_lock                     | table    | imrt_admin
 public | stim_link                        | table    | imrt_admin
 public | validation_result                | table    | imrt_admin
 public | validation_result_key_seq        | sequence | imrt_admin
(23 rows)
```