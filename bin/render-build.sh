#!/usr/bin/env bash
# exit on error
set -o errexit

nvm use 20.12.2

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate