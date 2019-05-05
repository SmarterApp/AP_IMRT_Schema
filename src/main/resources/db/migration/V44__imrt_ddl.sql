/*******************************************************************
* Alter commit id field needed for item for IMRT
********************************************************************/

ALTER TABLE item ALTER COLUMN commit_id SET DATA TYPE uuid USING commit_id::uuid;