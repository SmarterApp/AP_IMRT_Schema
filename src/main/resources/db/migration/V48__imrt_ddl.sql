/*******************************************************************
* Add migration version field to the latest item record
********************************************************************/

ALTER TABLE item ADD COLUMN migration_version_id VARCHAR NOT NULL DEFAULT '';
