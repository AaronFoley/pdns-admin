#!/bin/sh

set -o errexit
set -o pipefail

echo "===> Waiting for $PDA_DB_HOST MySQL service"
until nc -v -z \
  $PDA_DB_HOST \
  $PDA_DB_PORT;
do
  echo "Database ($PDA_DB_HOST) is unavailable - sleeping"
  sleep 1
done

echo "===> DB management"
# Go in Workdir
cd /powerdns
flask db upgrade

echo "===> Starting Powerdns-Admin"
exec /usr/local/bin/gunicorn -t 120 --workers 4 --bind '0.0.0.0:9191' --log-level info app:app
