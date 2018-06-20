/*******************************************************************
* IMRT-416: Adds TTS provided/required fields to item table
********************************************************************/
ALTER TABLE item ADD COLUMN sight_tts_provided BOOLEAN;
ALTER TABLE item ADD COLUMN visual_tts_provided BOOLEAN;
ALTER TABLE item ADD COLUMN visual_tts_required VARCHAR NOT NULL DEFAULT '';