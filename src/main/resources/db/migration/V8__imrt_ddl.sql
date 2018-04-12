/******************************************************************************
* Add unique index on id in the item table
*
******************************************************************************/

ALTER TABLE item ADD CONSTRAINT unique_id_constraint UNIQUE (id);
