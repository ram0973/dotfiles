#!/usr/bin/env bash

# Create Postgres database and user

# Exit on error. Append "|| true" if you expect an error.
set -o errexit
# Exit on error inside any functions or subshells.
set -o errtrace
# Do not allow use of undefined vars. Use ${VAR:-} to use an undefined VAR
# set -o nounset
# Catch the error in case mysqldump fails (but gzip succeeds) in `mysqldump |gzip`
set -o pipefail
# Turn on traces, useful while debugging but commented out by default
# set -o xtrace


if [ -z "$1" ]; then
  echo "No database specified. aborting."
  exit
fi

sudo su postgres <<EOF
psql -c "CREATE DATABASE $1 ;"
psql -c "CREATE USER $1 WITH ENCRYPTED PASSWORD '$1';"
psql -c "GRANT ALL PRIVILEGES ON DATABASE $1 TO $1;
"
EOF
