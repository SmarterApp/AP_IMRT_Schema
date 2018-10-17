/*****************************************************************
 * Relax constraint on the section keyword combinations
 *****************************************************************/
ALTER TABLE item_keyword DROP CONSTRAINT IF EXISTS unique_item_key_section_constraint;