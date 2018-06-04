/****************************************************
 * Add test administration data fields
 ****************************************************/

ALTER TABLE item ADD COLUMN item_difficulty_quintile integer;
ALTER TABLE item ADD COLUMN form_count integer;
ALTER TABLE item ADD COLUMN exposures_count integer;