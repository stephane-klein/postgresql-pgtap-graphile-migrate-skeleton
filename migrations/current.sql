-- Enter migration here
ALTER TABLE main.contacts ADD COLUMN IF NOT EXISTS firstname VARCHAR DEFAULT '';

-- boilerplate found here: https://www.codingvila.com/2021/05/rename-column-only-if-exists-in-postgresql.html
DO $$
BEGIN
    IF EXISTS(
        SELECT *
            FROM information_schema.columns
            WHERE (
                (table_schema='main') AND
                (table_name='contacts') AND
                (column_name='name')
            )
  ) THEN
      ALTER TABLE main.contacts RENAME name TO lastname;
  END IF;
END $$;
