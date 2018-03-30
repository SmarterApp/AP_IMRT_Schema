-- Used by JPA for polymorphic objects for items vs stimuli vs tutorials
ALTER TABLE item ADD COLUMN classification VARCHAR;

UPDATE item set classification = 'stim' where item_type = 'stim';
UPDATE item set classification = 'item' where item_type != 'stim';

ALTER TABLE item ALTER COLUMN classification SET NOT NULL;

-- The composite key allows multiple records with the same item_key as long as the stimulus is different
-- which is invalid in IMRT and IAT
ALTER TABLE stim_link DROP CONSTRAINT stim_link_pkey;
ALTER TABLE stim_link ADD PRIMARY KEY (item_key);