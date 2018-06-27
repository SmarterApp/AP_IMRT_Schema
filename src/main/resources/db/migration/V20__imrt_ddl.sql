/*******************************************************************
* IMRT-439: Update primary key constraint for attachments to include
* file_type
********************************************************************/
ALTER TABLE item_attachment
	DROP CONSTRAINT item_attachment_pkey;

ALTER TABLE item_attachment
	ADD CONSTRAINT item_attachment_pkey PRIMARY KEY(item_key, file_name, file_type);