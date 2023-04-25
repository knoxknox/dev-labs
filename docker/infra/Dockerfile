FROM ruby:3.2.2

WORKDIR /src
ADD /app/Gemfile /src/Gemfile
ADD /app/Gemfile.lock /src/Gemfile.lock
RUN apt-get update -qq && apt-get install -y build-essential

RUN bundle install
