require 'capistrano/ext/multistage'

set :application, "railbar"

set :scm, :git
set :repository,  "git@ajtran.git.beankstalkapp.com:/EmptyBridges/rails-rollbar.get"
set :scm_passphrase, ""

set :user, "atran"

set :stages, ["staging", "production"]
set :default_stage, "staging"
