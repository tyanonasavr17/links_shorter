FROM ruby:2.6.8

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./


RUN bundle install

COPY . /usr/src/app