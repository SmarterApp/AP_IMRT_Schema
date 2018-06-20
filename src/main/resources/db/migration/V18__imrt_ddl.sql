CREATE TEMPORARY TABLE item_attachment_temp (
  item_key integer NOT NULL,
  file_name character varying NOT NULL,
  file_type character varying NOT NULL,
  uploaded_at timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_at timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by character varying NOT NULL DEFAULT ''
);

-- Get the most recent item_attachment record that was created
INSERT INTO item_attachment_temp (item_key, file_name, file_type, uploaded_at, created_at, updated_at)
  SELECT
    item_key,
    file_name,
    file_type,
    MAX(uploaded_at),
    MAX(created_at),
    MAX(updated_at)
  FROM
    item_attachment
  GROUP BY
    item_key,
    file_name,
    file_type;

-- Set the user name to reflect the correct user
UPDATE
	item_attachment_temp tmp
SET
	updated_by = att.updated_by
FROM
	item_attachment att
	WHERE att.item_key = tmp.item_key
	AND att.file_name = tmp.file_name
	AND att.file_type = tmp.file_type
	AND att.uploaded_at = tmp.uploaded_at
	AND att.created_at = tmp.created_at
	AND att.updated_at = tmp.updated_at;

ALTER TABLE item_attachment DROP CONSTRAINT item_attachment_pkey;
ALTER TABLE item_attachment DROP COLUMN key;

DELETE FROM item_attachment;

INSERT INTO item_attachment (item_key, file_name, file_type, uploaded_at, created_at, updated_at, updated_by)
  SELECT
    item_key,
    file_name,
    file_type,
    uploaded_at,
    created_at,
    updated_at,
    updated_by
  FROM
    item_attachment_temp;

ALTER TABLE item_attachment ADD CONSTRAINT item_attachment_pkey PRIMARY KEY (item_key, file_name);

DROP TABLE item_attachment_temp;