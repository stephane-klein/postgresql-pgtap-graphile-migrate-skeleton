BEGIN;
SELECT plan(2);

SELECT has_table('main'::name, 'contacts'::name);
DELETE FROM main.contacts;

INSERT INTO main.contacts (firstname, lastname) VALUES('John', 'Doe');

SELECT * FROM main.contacts;

SELECT tap.cmp_ok(
    (SELECT COUNT(*) FROM main.contacts WHERE firstname = 'John')::INTEGER,
    '=',
    1::INTEGER
);

SELECT * FROM finish();
ROLLBACK;
