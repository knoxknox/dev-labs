FROM ruby:2.5.3

RUN mkdir /code
RUN apt-get update -qq && apt-get install -y build-essential

ADD . /code
WORKDIR /code

RUN bundle install
