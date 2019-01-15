/*******************************************************************
* Add assignees to IMRT reporting
********************************************************************/

CREATE TABLE item_assignment
(
  key SERIAL PRIMARY KEY,
  item_key   INT     NOT NULL REFERENCES item,
  assigned_to    VARCHAR NOT NULL,
  assigned_by    VARCHAR NOT NULL,
  assigned_date TIMESTAMPTZ NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_by VARCHAR NOT NULL
);

ALTER TABLE item ADD COLUMN assigned_to VARCHAR;
ALTER TABLE item ADD COLUMN assigned_by VARCHAR;
ALTER TABLE item ADD COLUMN assigned_dates VARCHAR;