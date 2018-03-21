/* Add current commit date column to item_git table. Use default on existing rows */
ALTER TABLE item_git ADD COLUMN current_commit_date TIMESTAMPTZ NOT NULL DEFAULT timestamp with time zone '1970-01-01';
/* No new rows without a value */
ALTER TABLE item_git ALTER COLUMN current_commit_date DROP DEFAULT;