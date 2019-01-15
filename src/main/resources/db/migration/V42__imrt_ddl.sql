/*******************************************************************
* Add unix date field to assigndate in item and fix keyword sections
********************************************************************/

update item_keyword set section = 'Table Column Headers' where section = 'Table column headers';
update item_keyword set section = 'Spanish Table Column Headers' where section = 'Spanish Table column headers';
update item_keyword set section = 'Table Row Labels' where section = 'Table row labels';
update item_keyword set section = 'Spanish Table Row Labels' where section = 'Spanish Table row labels';
update item_keyword set section = 'Spanish Table Row Labels' where section = 'Spanish Table row labels';

ALTER TABLE item ADD COLUMN assigned_date_sort VARCHAR;