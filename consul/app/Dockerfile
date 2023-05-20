FROM ruby:3.2.2

WORKDIR /code
COPY Gemfile /code/Gemfile
COPY Gemfile.lock /code/Gemfile.lock
RUN apt-get update -qq && apt-get install -y build-essential

RUN bundle install
