# README

Project to save memories with weather and geolocalization tags

## Requirements

* Ruby
* Rails
* Postgresql

## Setup database

* Create the database running this command

    ```bundle exec rake db:create```

## Deployment instructions

* Take a free api key in https://ipstack.com/
* Create a file `config/local_env.yml` and put your key:

```
IPSTACK_KEY: 'your_ip_stack_key'

```
