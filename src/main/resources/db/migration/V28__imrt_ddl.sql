/*
*  Drop audit columns from join table.  They complicate the mappings and this data is captured in the joined tables
*/

ALTER TABLE stim_link DROP COLUMN created_at;
ALTER TABLE stim_link DROP COLUMN updated_at;
ALTER TABLE stim_link DROP COLUMN updated_by;