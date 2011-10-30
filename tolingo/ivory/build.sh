#!/usr/bin/env bash

[ -z "$JOB_NAME" ] && echo "Please set JOB_NAME." && exit 1;
RAKE_CMD="bundle exec rake --trace RAILS_ENV=test"

# setup configuration files
#
cp config/amazon_s3.yml.sample config/amazon_s3.yml
cp config/newrelic.yml.sample config/newrelic.yml
cp config/database.yml.ci config/database.yml

# build!
#
script/bundler --local
$RAKE_CMD db:reset
$RAKE_CMD test
