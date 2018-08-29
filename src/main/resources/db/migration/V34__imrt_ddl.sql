/*******************************************************************
* Add validation severity counts
********************************************************************/

ALTER TABLE item
  ADD COLUMN severe_validation_result_count INTEGER NOT NULL DEFAULT 0,
  ADD COLUMN degraded_validation_result_count INTEGER NOT NULL DEFAULT 0,
  ADD COLUMN tolerable_validation_result_count INTEGER NOT NULL DEFAULT 0,
  ADD COLUMN benign_validation_result_count INTEGER NOT NULL DEFAULT 0;