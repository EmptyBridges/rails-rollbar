# README

git clone
change access tokens in rollbar.rb
make sure ruby is installed ruby -v. I'm using ruby 2.3.3p222.
make sure rails is installed rails -v. I'm using Rails 5.1.6.
install dependencies: bundle install

if you are getting an ffi error.. try following this -> https://github.com/ffi/ffi/issues/608
which says to add `gem 'ffi', '1.9.18'`

and then `bundle update ffi`

you may also have to install mysql
`brew install mysql`

... errors with openssl. like wha..

create database: rake db:create
run migrations: rake db:migrate
create routes: rake routes
run server: rails s
navigate to: http://localhost:3000/
