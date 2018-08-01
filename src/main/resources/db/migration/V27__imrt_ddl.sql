/*******************************************************************
* Add attachments uploaded after english last updated
********************************************************************/

ALTER TABLE item ADD COLUMN asl_attachments_changed_after_english_updated BOOLEAN NOT NULL DEFAULT FALSE;
ALTER TABLE item ADD COLUMN braille_attachments_changed_after_english_updated BOOLEAN NOT NULL DEFAULT FALSE;
ALTER TABLE item ADD COLUMN cc_attachments_changed_after_english_updated BOOLEAN NOT NULL DEFAULT FALSE;