FROM ruby:2.7.6

WORKDIR /src
ADD /app/Gemfile /src/Gemfile
RUN apt-get update -qq && apt-get install -y build-essential

RUN bundle install
