FROM ruby:3.2.2

WORKDIR /code
ADD Gemfile /code/Gemfile
RUN apt-get update -qq && apt-get install -y build-essential

RUN bundle install
