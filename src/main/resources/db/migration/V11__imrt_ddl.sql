/****************************************************
 * Add content task model column
 ****************************************************/

alter table item add column content_task_model character varying NOT NULL DEFAULT '';

update item set content_task_model = coalesce(item_json -> 'core' -> 'metadata' ->> 'contentTaskModel', '');