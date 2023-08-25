# PostgreSQL pgTAP and graphile-migrate skeleton

This repository is a skeleton that integrates [pgtap](https://pgtap.org/) and [graphile-worker](https://github.com/graphile/worker/).

In this skeleton, two PostgreSQL databases are defined in `docker-compose.yml`:

- the first, named `postgres`, is the "working" database, used by developer to develop its application
- the second, named `postgres-test`, is the database used to run unit tests, via [pgTAP](https://pgtap.org/) (version `1.2.0`)

Why two separate databases? For two reasons:

- because unit tests often need to be run in a specific data context
- because the developer doesn't want that unit tests modify the database which use to develop the application

Important details:

- the `contacts` table is declared in the `main` schema
- the `public` schema is removed and never used
- the `search_path` configuration option is set to `""`, then you must always specify the schema for each table
 

```sh
$ ./scripts/init.sh
```

Next, execute:

```
$ pnpm run migrate:watch
```

Execute tests:

```
$ pnpm run migrate-test:watch
$ ./scripts/tests.sh
/sqls/tests/test1.sql .. ok
All tests successful.
Files=1, Tests=2,  0 wallclock secs ( 0.01 usr  0.00 sys +  0.01 cusr  0.00 csys =  0.02 CPU)
Result: PASS
```

You can also run a specific test:

```sh
$ ./scripts/tests.sh sqls/tests/test1.sql
/sqls/tests/test1.sql .. ok
All tests successful.
Files=1, Tests=2,  0 wallclock secs ( 0.01 usr  0.00 sys +  0.01 cusr  0.00 csys =  0.02 CPU)
Result: PASS
```

Apply migration in `migrations/current.sql` and commit:

```sh
$ pnpm run migrate:commit
```
