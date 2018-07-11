/*******************************************************************
* Add test category as an indexed field
********************************************************************/

ALTER TABLE item ADD COLUMN test_category VARCHAR NOT NULL DEFAULT '';