[PowerDNS-Admin]: https://github.com/ngoduykhanh/PowerDNS-Admin

# PowerDNS-Admin Docker Container

[PowerDNS-Admin][] is a web interface for PowerDNS

This is a smallish Alpine based docker image that runs that application using Gunicorn

```
docker run \
-e PDA_SECRET_KEY=changeme \
-e PDA_DB_HOST=10.71.4.10 \
-e PDA_DB_NAME=powerdns-admin \
-e PDA_DB_USER=powerdns \
-e PDA_DB_PASSWORD=powerdns \
-e PDA_DB_PORT=3306 \
-p 9191:9191 \
aaronsfoley/pdns-admin
```

The /example directory contains an example of running this with docker compose

## Environment Variables

* *PDA_DB_DRIVER*

  The Database driver to use when building the SQLAlchemy DB URI
  **NOTE**: Only tested with mssql
* *PDA_DB_NAME*

  Name of the database to connect to
* *PDA_DB_USER*

  Name of the user used to connect to the database
* *PDA_DB_PASSWORD*

  Password of the user used to connect to the database
* *PDA_DB_PORT*

  Database port to connect to, defaults to 3306
* *PDA_SECRET_KEY*

  Flask secret key, must be set
* *PDA_LOG_LEVEL*

  Logging level, defaults to DEBUG
* *PDA_LOG_FILE*

  Log File location, defaults to None, which causes logs to go to STDOUT
* *PDA_TIMEOUT*

  Timeout value for large zones

## Further Configuration

Once running, you will be able to create a user, the first user created will automatically be given admin privileges.


Most settings are stored in the database and can be set within the GUI