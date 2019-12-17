/*******************************************************************
* Add fields needed for item for IMRT
********************************************************************/

ALTER TABLE item ADD COLUMN pencil_paper VARCHAR NOT NULL DEFAULT '';
ALTER TABLE item ADD COLUMN state_specific_use VARCHAR NOT NULL DEFAULT '';
ALTER TABLE item ADD COLUMN state_specific_use_description VARCHAR NOT NULL DEFAULT '';