/*************************************************************
 * Denormalize the data for better search performance
 *************************************************************/

ALTER TABLE item
  ADD COLUMN primary_claim character varying NOT NULL DEFAULT '';
ALTER TABLE item
  ADD COLUMN primary_content_domain character varying NOT NULL DEFAULT '';
ALTER TABLE item
  ADD COLUMN primary_common_core_standard character varying NOT NULL DEFAULT '';
ALTER TABLE item
  ADD COLUMN primary_target character varying NOT NULL DEFAULT '';

ALTER TABLE item
  ADD COLUMN secondary_claim character varying NOT NULL DEFAULT '';
ALTER TABLE item
  ADD COLUMN secondary_content_domain character varying NOT NULL DEFAULT '';
ALTER TABLE item
  ADD COLUMN secondary_common_core_standard character varying NOT NULL DEFAULT '';
ALTER TABLE item
  ADD COLUMN secondary_target character varying NOT NULL DEFAULT '';

ALTER TABLE item
  ADD COLUMN tertiary_claim character varying NOT NULL DEFAULT '';
ALTER TABLE item
  ADD COLUMN tertiary_content_domain character varying NOT NULL DEFAULT '';
ALTER TABLE item
  ADD COLUMN tertiary_common_core_standard character varying NOT NULL DEFAULT '';
ALTER TABLE item
  ADD COLUMN tertiary_target character varying NOT NULL DEFAULT '';

ALTER TABLE item
  ADD COLUMN quaternary_claim character varying NOT NULL DEFAULT '';
ALTER TABLE item
  ADD COLUMN quaternary_content_domain character varying NOT NULL DEFAULT '';
ALTER TABLE item
  ADD COLUMN quaternary_common_core_standard character varying NOT NULL DEFAULT '';
ALTER TABLE item
  ADD COLUMN quaternary_target character varying NOT NULL DEFAULT '';

/**
Update new columns with data already ingested
 */

update item
set
  primary_claim                = standard_id.claim,
  primary_content_domain       = standard_id.content_domain,
  primary_common_core_standard = standard_id.common_core_standard,
  primary_target = standard_id.target
FROM standard_id where item.key = standard_id.item_key and standard_id.type = 1;

update item
set
  secondary_claim                = standard_id.claim,
  secondary_content_domain       = standard_id.content_domain,
  secondary_common_core_standard = standard_id.common_core_standard,
  secondary_target = standard_id.target
FROM standard_id where item.key = standard_id.item_key and standard_id.type = 2;

update item
set
  tertiary_claim                = standard_id.claim,
  tertiary_content_domain       = standard_id.content_domain,
  tertiary_common_core_standard = standard_id.common_core_standard,
  tertiary_target               = standard_id.target
FROM standard_id where item.key = standard_id.item_key and standard_id.type = 3;

update item
set
  quaternary_claim                = standard_id.claim,
  quaternary_content_domain       = standard_id.content_domain,
  quaternary_common_core_standard = standard_id.common_core_standard,
  quaternary_target               = standard_id.target
FROM standard_id where item.key = standard_id.item_key and standard_id.type = 4;

/**
Drop the standard_id table;
 */
DROP TABLE standard_id;