/****************************************************
 * Add item author field
 ****************************************************/

alter table item add column item_author character varying(100) NOT NULL DEFAULT '';