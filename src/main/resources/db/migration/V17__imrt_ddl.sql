/*******************************************************************
* IMRT-416: Adds TTS provided/required fields to item table
********************************************************************/
ALTER TABLE item ADD COLUMN sight_tts_provided VARCHAR NOT NULL DEFAULT '';
ALTER TABLE item ADD COLUMN visual_tts_provided VARCHAR NOT NULL DEFAULT '';
ALTER TABLE item ADD COLUMN visual_tts_required VARCHAR NOT NULL DEFAULT '';

-- Populate new fields with ingested item.json data
UPDATE
	item
SET
	sight_tts_provided = item_json->'textToSpeech'->>'isSightTTSProvided',
	visual_tts_provided = item_json->'textToSpeech'->>'isVisualTTSProvided',
	visual_tts_required = item_json->'textToSpeech'->>'isVisualTTSRequired';