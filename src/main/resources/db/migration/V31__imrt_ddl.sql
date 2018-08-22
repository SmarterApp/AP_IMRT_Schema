/**
 * Add columns to store data for content changes
 */

ALTER TABLE item ADD COLUMN status_set_operational_at TIMESTAMPTZ;
ALTER TABLE item ADD COLUMN content_changed_after_operational boolean NOT NULL DEFAULT FALSE;