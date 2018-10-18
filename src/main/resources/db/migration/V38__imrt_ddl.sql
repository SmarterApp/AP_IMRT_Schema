/***************************************************
 * Improve the performance of the keyword search by
 * limiting the section field and adding a trigram
 * index to item_keyword content
 ***************************************************/
ALTER TABLE item_keyword ALTER COLUMN section SET DATA TYPE varchar(60);
