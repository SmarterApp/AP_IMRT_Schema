CREATE TABLE item_attachment (
  key             SERIAL PRIMARY KEY,
  item_key        INT NOT NULL REFERENCES item,
  file_name       VARCHAR NOT NULL,
  file_type       VARCHAR NOT NULL,
  uploaded_at     TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_by      VARCHAR     NOT NULL
);
CREATE INDEX ix_item_attachment_key_file_type ON item_attachment(key, file_type);

ALTER TABLE item ADD COLUMN asl_required VARCHAR NOT NULL DEFAULT '';
ALTER TABLE item ADD COLUMN asl_provided VARCHAR NOT NULL DEFAULT '';
ALTER TABLE item ADD COLUMN braille_required VARCHAR NOT NULL DEFAULT '';
ALTER TABLE item ADD COLUMN braille_provided VARCHAR NOT NULL DEFAULT '';
ALTER TABLE item ADD COLUMN cc_required VARCHAR NOT NULL DEFAULT '';
ALTER TABLE item ADD COLUMN cc_provided VARCHAR NOT NULL DEFAULT '';
ALTER TABLE item ADD COLUMN translation_required VARCHAR NOT NULL DEFAULT '';
ALTER TABLE item ADD COLUMN translation_provided VARCHAR NOT NULL DEFAULT '';