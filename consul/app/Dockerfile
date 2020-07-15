FROM ruby:2.7.1

WORKDIR /code
ADD Gemfile /code/Gemfile
RUN apt-get update -qq && apt-get install -y build-essential

RUN bundle install
