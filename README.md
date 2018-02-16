![alt text](https://www.dropbox.com/s/js1wkzyl21vcyrh/logoapp2.png?raw=1) 
# Nosso Amigo Secreto

Project developed in Bootcamp OneBitCode

- Allows create campaigns 'Amigo Secreto', and to notify by email each participant about your results in the raffle

## Pré-requisits

* Ruby version - 2.3.6
* Rails version - 5.0.6
* Database - Postgres
* Redis
* Sidekiq
* Mailcatcher

## Running with Docker

It's very easy.
* Install docker and docker-compose in your machine
* Run _docker-compose build_ to prepare the project and _docker-compose up_
* Access http://localhost:3000 to visit the application
* Mailcatcher should be running in http://localhost:1080

## Tests executing

Tests were written with Rspec, to execute then do:
* _docker-compose run --rm website bundle exec rspec spec_