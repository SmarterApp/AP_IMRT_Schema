/**************************************************************
 * Add Glossary Information
 **************************************************************/

ALTER TABLE item
  ADD COLUMN english_glossary_provided boolean NOT NULL DEFAULT FALSE;
ALTER TABLE item
  ADD COLUMN illustrated_glossary_provided boolean NOT NULL DEFAULT FALSE;
ALTER TABLE item
  ADD COLUMN illustrated_glossary_required VARCHAR NOT NULL DEFAULT '';
ALTER TABLE item
  ADD COLUMN translated_glossary_provided boolean NOT NULL DEFAULT FALSE;
ALTER TABLE item
  ADD COLUMN translated_glossary_required VARCHAR NOT NULL DEFAULT '';