/******************************************************************************
* Add the time the workflow status was set to the item table
******************************************************************************/

/* Use default for existing rows */
ALTER TABLE item ADD COLUMN workflow_status_set_at TIMESTAMPTZ NOT NULL DEFAULT timestamp with time zone '1970-01-01';

/* No new rows without a value */
ALTER TABLE item ALTER COLUMN workflow_status_set_at DROP DEFAULT;
