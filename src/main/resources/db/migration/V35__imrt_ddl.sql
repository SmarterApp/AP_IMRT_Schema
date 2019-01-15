/*******************************************************************
* Add item keyword table
********************************************************************/

CREATE TABLE item_keyword(
  key SERIAL PRIMARY KEY,
  item_key        INT     NOT NULL REFERENCES item,
  section         VARCHAR(25),
  content         VARCHAR NOT NULL,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_by      VARCHAR NOT NULL
);

ALTER TABLE item_keyword ADD CONSTRAINT unique_item_key_section_constraint UNIQUE (item_key, section);
