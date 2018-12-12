/*******************************************************************
* Add Enhanced IDs to Item table
********************************************************************/

ALTER TABLE item ADD COLUMN primary_enhanced_id VARCHAR;
ALTER TABLE item ADD COLUMN secondary_enhanced_id VARCHAR;
ALTER TABLE item ADD COLUMN tertiary_enhanced_id VARCHAR;
ALTER TABLE item ADD COLUMN quaternary_enhanced_id VARCHAR;
