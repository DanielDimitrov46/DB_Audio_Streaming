# DB_Audio_Streaming

# Database Requirements

## Tables

- The database must contain at least five tables.
- The database must include all three types of relationships: one-to-one, one-to-many, and many-to-many. Each relationship implementation should be logical (i.e., don't implement a relationship solely because it's required by the assignment).
- The database must be normalized. A table may break normalization only if there is a justified reason (e.g., the speed of a specific query).
- Each table must contain at least 3 rows.

## Triggers

- The database must contain the following triggers:
    - Insert triggers - before and after
    - Update triggers - before and after
- The implementation of each trigger should be logical (i.e., don't implement a trigger solely because it's required by the assignment).

## Views

- The database must contain at least three views.
- The implementation of each view should be logical (i.e., don't implement a view solely because it's required by the assignment).

## Users and Roles

- The database must contain roles.
- There should be at least one role with database-level privileges.
- There should be at least one role with table-level privileges.
- There should be at least one role with column-level privileges.
- Each role should have at least one user.

## Indexes

- The database must contain at least one simple index.
- The database must contain at least one composite index.
- The database must contain at least one prefix index.
- The implementation of each index should be logical (i.e., don't implement an index solely because it's required by the assignment).

## Transactions

- Provide an example of queries that should be grouped into a transaction.
- The example should be logical.

## Distribution

The work should be evenly distributed among team members. An example distribution for a team of 4 members could be:
- One member responsible for creating the tables.
- One member responsible for creating the triggers.
- One member responsible for views and roles.
- One member responsible for indexes and transactions.

## Format

- The SQL scripts for creating the database should be stored in a GitHub repository accessible to all team members.
- The scripts for each part should be stored in separate '.sql' files. For example, the scripts for creating the tables should be in a file named `tables.sql`, the scripts for triggers in `triggers.sql`, and so on.
