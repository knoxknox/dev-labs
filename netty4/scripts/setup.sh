#!/bin/bash

rvm install $(cat .ruby-version)
gem install bundler --no-document
gem update --system && bundle install && jbundle install
