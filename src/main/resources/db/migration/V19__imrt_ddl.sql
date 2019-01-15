CREATE TABLE item_form (
  key SERIAL PRIMARY KEY,
  item_key        INT     NOT NULL REFERENCES item,
  assessment_type VARCHAR,
  form_id         VARCHAR,
  form_type       VARCHAR,
  exposures       INT,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_by      VARCHAR NOT NULL
);