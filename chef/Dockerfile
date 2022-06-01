FROM ruby:2.7.6

WORKDIR /code
RUN apt-get update -qq && apt-get install -y curl build-essential

RUN curl -L https://www.chef.io/chef/install.sh | bash
RUN /opt/chef/embedded/bin/gem install --no-document berkshelf -v 7.2.2
