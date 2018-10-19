/***************************************************
 * Improve the performance of the keyword search by adding an index.
 ***************************************************/
CREATE INDEX idx_item_key_section ON item_keyword (item_key, section);
