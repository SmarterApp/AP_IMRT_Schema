/****************************************************
 * Make item id numeric
 ****************************************************/

ALTER TABLE item ALTER COLUMN id TYPE integer USING (trim(id)::integer);
ALTER TABLE item ALTER COLUMN associated_stimulus_id TYPE integer USING (trim(associated_stimulus_id)::integer);