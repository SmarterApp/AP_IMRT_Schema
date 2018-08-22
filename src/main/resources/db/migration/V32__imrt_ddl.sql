/**
 * Create the content update needs
 */

CREATE TABLE item_content_update_need (
  key SERIAL PRIMARY KEY,
  item_key                        INT NOT NULL REFERENCES item,
  internal_resolution             VARCHAR,
  notes                           VARCHAR,
  resolution                      VARCHAR,
  resolution_notes                VARCHAR,
  content_update_need_create_date TIMESTAMPTZ,
  internal_resolution_date        TIMESTAMPTZ,
  resolution_date                 TIMESTAMPTZ,
  created_at                      TIMESTAMPTZ,
  updated_at                      TIMESTAMPTZ,
  updated_by                      VARCHAR NOT NULL
);

ALTER TABLE item ADD COLUMN unresolved_update_need boolean NOT NULL DEFAULT FALSE;
ALTER TABLE item ADD COLUMN current_update_need_create_date TIMESTAMPTZ;
ALTER TABLE item ADD COLUMN current_update_need_internal_resolution_date TIMESTAMPTZ;
ALTER TABLE item ADD COLUMN current_update_need_internal_resolution VARCHAR NOT NULL DEFAULT '';
ALTER TABLE item ADD COLUMN current_update_need_resolution_date TIMESTAMPTZ;
ALTER TABLE item ADD COLUMN current_update_need_resolution VARCHAR NOT NULL DEFAULT '';