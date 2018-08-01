/*******************************************************************
* Add attachments uploaded after english last updated
********************************************************************/

ALTER TABLE item ADD COLUMN asl_uploaded_prior_to_last_content_update BOOLEAN NOT NULL DEFAULT FALSE;
ALTER TABLE item ADD COLUMN braille_uploaded_prior_to_last_content_update BOOLEAN NOT NULL DEFAULT FALSE;
ALTER TABLE item ADD COLUMN closed_captioning_uploaded_prior_to_last_content_update BOOLEAN NOT NULL DEFAULT FALSE;