/*******************************************************************
* Add index to item table to facilitate common searches
********************************************************************/

CREATE INDEX ix_item_id_associated_stimulus_id_workflow_status_grade_subject ON item(id,
  associated_stimulus_id,
  workflow_status,
  grade,
  subject);