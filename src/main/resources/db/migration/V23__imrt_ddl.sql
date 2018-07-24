/*******************************************************************
* Add English last updated at as an indexed field
********************************************************************/

ALTER TABLE item
  ADD COLUMN english_content_last_updated_at TIMESTAMPTZ NOT NULL DEFAULT current_timestamp;