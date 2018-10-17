/***************************************************
 * Expand size of the fields in keyword and remove audit fields
 ***************************************************/

ALTER TABLE item_keyword DROP COLUMN updated_by;
ALTER TABLE item_keyword DROP COLUMN created_at;
ALTER TABLE item_keyword DROP COLUMN updated_at;

ALTER TABLE item_keyword ALTER COLUMN content SET DATA TYPE text;
ALTER TABLE item_keyword ALTER COLUMN section SET DATA TYPE text;