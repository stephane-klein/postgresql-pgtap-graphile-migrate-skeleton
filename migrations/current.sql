-- Enter migration here
ALTER TABLE main.contacts ADD COLUMN IF NOT EXISTS firstname VARCHAR DEFAULT '';
ALTER TABLE main.contacts RENAME name TO lastname;
