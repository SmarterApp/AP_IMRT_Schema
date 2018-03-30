ALTER TABLE item ADD COLUMN classification VARCHAR;

UPDATE item set classification = 'stim' where item_type = 'stim';
UPDATE item set classification = 'item' where item_type != 'stim';

ALTER TABLE item ALTER COLUMN classification SET NOT NULL;
