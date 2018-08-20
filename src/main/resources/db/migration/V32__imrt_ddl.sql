/**
 * Create view to contain the latest content update need by created at
 */

CREATE VIEW latest_item_content_update_need AS
  SELECT item_content_update_need.*
  FROM item_content_update_need
  INNER JOIN (
               select item_key, MAX(content_update_need_create_date) as created_at from item_content_update_need group by item_key
  ) as latest_record
  ON latest_record.item_key = item_content_update_need.item_key
  AND latest_record.created_at = item_content_update_need.content_update_need_create_date;