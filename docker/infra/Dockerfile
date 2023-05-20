FROM ruby:3.2.2

WORKDIR /src
COPY /app/Gemfile /src/Gemfile
COPY /app/Gemfile.lock /src/Gemfile.lock
RUN apt-get update -qq && apt-get install -y build-essential

RUN bundle install
