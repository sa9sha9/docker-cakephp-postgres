#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER pilot;
    CREATE DATABASE pilotdb;
    GRANT ALL PRIVILEGES ON DATABASE pilotdb TO pilot;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" pilotdb < hoge.sql
