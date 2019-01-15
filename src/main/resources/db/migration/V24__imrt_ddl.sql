/*******************************************************************
* Add Scoring Engine as an indexed field
********************************************************************/

ALTER TABLE item
  ADD COLUMN scoring_engine VARCHAR NOT NULL DEFAULT '';