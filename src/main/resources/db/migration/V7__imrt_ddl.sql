/******************************************************************************
* Add organization ingest fields to the item table:
*
*   organization_type_id
*   organization_name
******************************************************************************/
ALTER TABLE item ADD COLUMN organization_type_id VARCHAR NOT NULL DEFAULT '';
ALTER TABLE item ADD COLUMN organization_name VARCHAR NOT NULL DEFAULT '';

-- IAT will never pass a NULL value for organization data, so the DEFAULT constraint can be dropped after the item table
-- has been altered.  Providing a NULL value for either of these fields means something has gone wrong.
ALTER TABLE item ALTER COLUMN organization_type_id DROP DEFAULT;
ALTER TABLE item ALTER COLUMN organization_name DROP DEFAULT;