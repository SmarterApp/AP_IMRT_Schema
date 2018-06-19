/*******************************************************************
* IMRT-416: Adds TTS provided/required fields to item table
********************************************************************/
ALTER TABLE item ADD COLUMN sight_tts_provided BOOLEAN NOT NULL DEFAULT FALSE;
ALTER TABLE item ADD COLUMN visual_tts_provided BOOLEAN NOT NULL DEFAULT FALSE;
ALTER TABLE item ADD COLUMN visual_tts_required VARCHAR NOT NULL DEFAULT '';

-- Populate new fields with ingested item.json data
UPDATE
	item
SET
	sight_tts_provided = (item_json->'textToSpeech'->>'isSightTTSProvided')::boolean,
	visual_tts_provided = (item_json->'textToSpeech'->>'isVisualTTSProvided')::boolean,
	visual_tts_required = item_json->'textToSpeech'->>'isVisualTTSRequired';