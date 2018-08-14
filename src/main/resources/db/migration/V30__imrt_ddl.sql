/*******************************************************************
* Add passages support
********************************************************************/

ALTER TABLE item ADD COLUMN english_passages_count INT NOT NULL DEFAULT 0;
ALTER TABLE item ADD COLUMN spanish_passages_count INT NOT NULL DEFAULT 0;