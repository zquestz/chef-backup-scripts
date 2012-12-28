## DESCRIPTION

Installs and configures commonly used backup scripts to run once a day.

## REQUIREMENTS

Only tested on Debian 6.0 and Ubuntu 12.04.

## USAGE

backup\_scripts:postgresql - Installs and configures the PostgreSQL backup
  scripts. Requires that PostgreSQL is installed and running locally, managed via
  the "postgresql" cookbook.

backup\_scripts:mysql - Installs and configures the MySQL backup
  scripts. Requires that MySQL is installed and running locally, managed via
  the "mysql" cookbook.

backup\_scripts:mongodb - Installs and configures the MongoDB backup
  scripts. Requires that MongoDB is installed and running locally, managed via
  the "mongodb" cookbook.
