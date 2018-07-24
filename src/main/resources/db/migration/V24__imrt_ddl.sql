/*******************************************************************
* Add Spanish last updated at as an indexed field
********************************************************************/

ALTER TABLE item
  ADD COLUMN spanish_content_last_updated_at TIMESTAMPTZ NOT NULL DEFAULT current_timestamp;