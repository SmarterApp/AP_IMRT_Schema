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
  content_update_need_create_date TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  internal_resolution_date        TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  resolution_date                 TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  created_at                      TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_at                      TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_by                      VARCHAR NOT NULL
);