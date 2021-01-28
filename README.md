# `dbanonymizer`

This tool anonymize data in table fields according strategy file. Working with MySQL, MariaDB, Postgres, MSSQL.
Docker is used to encapsulate all transformations and save clean host system.

Convenient tool to anonymize production database dump and use for developing and testing purposes.

## How does it work?
This project based on `pynonymizer` library. Home page is [here](https://github.com/jerometwell/pynonymizer/). The library replaces personally identifiable data in your database with **realistic** pseudorandom data.
We developed convenient docker shell to encapsulate dump anonymization process.


There are multiple data types available for replacing to faked data:

* `first_name`
* `last_name`
* `name`
* `user_name`
* `email`
* `company_email`
* `phone_number`
* `company`
* `bs`
* `catch_phrase`
* `job`
* `city`
* `street_address`
* `postcode`
* `uri`
* `ipv4_private`
* `ipv4_public`
* `file_name`
* `file_path`
* `paragraph`
* `prefix`
* `random_int`
* `date_of_birth`
* `future_date`
* `past_date`
* `future_datetime`
* `past_datetime`
* `date`
* `user_agent`
* `domain_name`
* `mac_address`
* `isbn13`
* `paragraph`
* `word`
* `credit_card_number`

For a full list of data generation strategies, see the docs on [strategyfiles](https://github.com/jerometwell/pynonymizer/blob/master/doc/strategyfiles.md)

### What does the tool do inside?

1. Restore temporary database from dumpfile (```DUMP_INPUT_FILE``` env. variable).
1. Anonymize temporary database with strategy file (```STRATEGY_FILE``` env. variable).
1. Dump resulting data to file (```DUMP_OUTPUT_FILE``` env. variable).
1. Drop temporary database.

## Requirements
* Docker
* Docker-compose

### mysql
* backup file in plain .sql/sql.gz (schema and data) 

### postgres
* backup file in plain .sql/sql.gz (schema and data)

# Getting Started

## Usage
1. Write a [strategyfile](https://github.com/jerometwell/pynonymizer/blob/master/doc/strategyfiles.md) for your database
1. Set environment variables in local.env file
    ```
    STRATEGY_FILE=
    DUMP_INPUT_FILE=
    DUMP_OUTPUT_FILE=
    SEED_ROWS=
    LOCALE=
    ```
    If your dump has CREATE DATABASE statement, please make sure ```DB_NAME``` variable has same db name or delete this CREATE DATABASE statement from dump file.
1. Choose what DB you use according your dump. Comment/Uncomment mysql or postgres section to use appropriate connection.
    ```
    DB_TYPE=mysql
    DB_HOST=db-mysql
    DB_PORT=3306
    DB_NAME=dl
    DB_USER=root
    DB_PASSWORD=rootpass```
1. Run command ```./run.sh```. Script will create all needed containers and then delete it after work will be done.
    Anonymized dump will be placed in this path: ```DUMP_OUTPUT_FILE```