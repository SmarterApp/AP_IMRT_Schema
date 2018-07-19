/*******************************************************************
* Create the item validation error table
********************************************************************/

CREATE TABLE validation_result (
  key SERIAL PRIMARY KEY,
  item_key             INT     NOT NULL REFERENCES item,
  validation_item_id   VARCHAR NOT NULL,
  validation_item_type VARCHAR NOT NULL DEFAULT '',
  category             VARCHAR NOT NULL DEFAULT '',
  severity             VARCHAR NOT NULL DEFAULT '',
  message              VARCHAR NOT NULL DEFAULT '',
  detail               VARCHAR NOT NULL DEFAULT '',
  created_at      TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_by           VARCHAR NOT NULL
);