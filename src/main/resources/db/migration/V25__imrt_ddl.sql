/*******************************************************************
* Add Spanish last updated at as an indexed field
********************************************************************/

ALTER TABLE item
  ADD COLUMN spanish_content_last_updated_at TIMESTAMPTZ NULL;

-- make english_content_last_updated_at nullable and remove the default
ALTER TABLE item
  ALTER COLUMN english_content_last_updated_at DROP NOT NULL;

ALTER TABLE item
  ALTER COLUMN english_content_last_updated_at DROP DEFAULT;