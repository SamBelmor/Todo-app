#  Todo-App

This application can CRUD tasks on a list, user can export their tasks to CSV and PDF files.

# Setup Todo-App

## Clone repository

Clone the repository in your local with the next command:

    $ git clone git@github.com:SamBelmor/Todo-app.git

## Install the dependencies

You need to install the dependencies specified in your Gemfile, you do this with the next command: 

    $ bundle install

## Create the database

Create the database with the following command:

    $ rake db:create

## Setup the tables in the database

You need to setup the migrations with the next command:

    $ rake db:migrate

## Initialize your server

    $ rails s

## Go to your local server

And finally go to your local server with the next route in your navigator

    http://localhost:3000
