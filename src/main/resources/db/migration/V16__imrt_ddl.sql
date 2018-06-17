/*******************************************************************
* Adds writing purpose and performance task values in item
********************************************************************/

ALTER TABLE item ADD COLUMN writing_purpose VARCHAR NOT NULL DEFAULT '';
ALTER TABLE item ADD COLUMN performance_task VARCHAR NOT NULL DEFAULT '';