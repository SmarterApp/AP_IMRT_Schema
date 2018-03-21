/* Add current commit date column to item_git table */
ALTER TABLE item_git ADD COLUMN current_commit_date TIMESTAMPTZ NOT NULL DEFAULT timestamp with time zone '1970-01-01';