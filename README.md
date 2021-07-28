# N8n + Dokku 

This repository contains the required scripts and commands to deploy n8n using Dokku on Debian-based systems.

## Requirements : 

* A dokku app properly created in you remote environment ([Dokku deploy tutorial](https://dokku.com/docs/deployment/application-deployment/#deploy-tutorial))
* A fresh clone of this repository in your local environment

## Setup :

### Setting app version :

```
# WHERE 0.121.0 is the version you want to install

dokku docker-options:add n8n build --build-arg N8N_VERSION=0.121.0
```

### Nginx Configuration :

#### Disable proxy buffering

```
# Allows to maintain the push connexion
dokku nginx:set n8n proxy-buffering off
```

#### Forward ports for HTTPS (recommended)
Follow this guide : [Setting up SSL with Dokku](https://dokku.com/docs/deployment/application-deployment/#setting-up-ssl)
or configure Dokku with Let's Encrypt

```
# Expose the right ports from the docker container

dokku proxy:ports-set <app_name> https:443:5678
```

#### ... or forward ports for HTTP

```
dokku proxy:ports-set <app_name> http:80:5678
```

### General configuration : 

```
# set the main encryption key, if not set n8n assigns a random value after each deploy
dokku config:set n8n  N8N_ENCRYPTION_KEY=arandomstringofcharacters

# set the webhook url
dokku config:set n8n WEBHOOK_TUNNEL_URL="https://your_production_url"

# optional : basic auth
dokku config:set n8n N8N_BASIC_AUTH_ACTIVE=true N8N_BASIC_AUTH_USER=a_username N8N_BASIC_AUTH_PASSWORD=a_secure_password
```

### Database configuration 
It is mandatory to set-up postgres as the sqlite database is lost after every build

```
# This will download and install the Postgres plugin
sudo dokku plugin:install https://github.com/dokku/dokku-postgres.git

# Creates a new database and link it to your application
dokku postgres:create n8n-db -p <password>
dokku postgres:link n8n-db n8n

# Set the proper n8n postgres config :  

dokku config:set n8n DB_TYPE=postgresdb \
DB_POSTGRESDB_HOST=172.17.0.10 \
DB_POSTGRESDB_DATABASE=<underscored_database_name, here: n8n_db> \
DB_POSTGRESDB_PASSWORD=<password>
```

## Notes :

#### Updating n8n
```
# WHERE 0.121.0 is the lastest version

dokku docker-options:add n8n build --build-arg N8N_VERSION=0.121.0
dokku ps:rebuild n8n
```

## License

n8n is [fair-code](http://faircode.io) distributed under [**Apache 2.0 with Commons Clause**](https://github.com/n8n-io/n8n/blob/master/packages/cli/LICENSE.md) license.

Dokku is under MIT License © Jeff Lindsay

n8n-dokku is under MIT License
