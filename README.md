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
* Take a free api key in http://openweathermap.org
* Create a file `config/local_env.yml` and put your keys:

```
IPSTACK_KEY: 'your_ip_stack_key'
OPEN_WEATHER_KEY:: 'your_open_weather_key'
```

* Run ```bundle install```
* Run ```bundle exec rake db:migrate```
* Start the server local ```rails server```
