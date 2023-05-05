FROM ruby:3.2.2

WORKDIR /code
ADD Gemfile /code/Gemfile
ADD Gemfile.lock /code/Gemfile.lock
RUN apt-get update -qq && apt-get install -y build-essential

RUN bundle install
