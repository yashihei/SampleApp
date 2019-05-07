FROM ruby:2.5

ENV APP_ROOT /myqpp
ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y build-essential nodejs

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock

RUN gem install bundler
RUN bundle install -j4

ADD . $APP_ROOT

EXPOSE 3000
