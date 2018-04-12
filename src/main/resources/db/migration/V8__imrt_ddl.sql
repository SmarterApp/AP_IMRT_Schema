/******************************************************************************
* Add the is_being_created and ingest_source fields to support ghost items
******************************************************************************/

ALTER TABLE item ADD COLUMN is_being_created boolean NOT NULL DEFAULT FALSE;
ALTER TABLE item_git ADD COLUMN ingest_source VARCHAR NOT NULL DEFAULT 'master';
ALTER TABLE item_log ADD COLUMN ingest_source VARCHAR NOT NULL DEFAULT 'master';
