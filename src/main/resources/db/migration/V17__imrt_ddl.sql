CREATE TEMPORARY TABLE item_attachment_temp (
    item_key integer NOT NULL,
    file_name character varying NOT NULL,
    file_type character varying NOT NULL,
    uploaded_at timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying NOT NULL
);

-- Get the first item_attachment record that was created
INSERT INTO item_attachment_temp (item_key, file_name, file_type, uploaded_at, created_at, updated_at, updated_by)
SELECT
	item_key,
	file_name,
	file_type,
	uploaded_at,
	MIN(updated_at),
	MIN(created_at),
	updated_by
FROM
	item_attachment
GROUP BY
	item_key,
	file_name,
	file_type,
	uploaded_at,
	updated_by;


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