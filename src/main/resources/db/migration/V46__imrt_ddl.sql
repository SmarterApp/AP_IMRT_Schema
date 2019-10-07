/************
 * Add occurrence timestamp to track when the validation result appears.
 ************/

ALTER TABLE validation_result ADD COLUMN occurrence_date TIMESTAMPTZ default current_timestamp;

UPDATE validation_result set occurrence_date = current_timestamp;

ALTER TABLE validation_result ALTER COLUMN occurrence_date set not null;