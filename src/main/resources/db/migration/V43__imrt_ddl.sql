/*******************************************************************
* Add fields needed for item for IMRT
********************************************************************/

ALTER TABLE item ADD COLUMN commit_id VARCHAR;
ALTER TABLE item ADD COLUMN item_version VARCHAR;