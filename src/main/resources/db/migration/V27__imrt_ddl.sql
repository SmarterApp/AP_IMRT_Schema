/*******************************************************************
* Add attachments uploaded after english last updated
********************************************************************/

ALTER TABLE item ADD COLUMN attachments_changed_after_english_updated BOOLEAN NOT NULL DEFAULT FALSE;