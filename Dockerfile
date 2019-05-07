FROM ruby:2.5

ENV APP_ROOT /myapp
ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y build-essential nodejs

WORKDIR $APP_ROOT

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock

RUN gem install bundler
RUN bundle install -j4

ADD . $APP_ROOT

EXPOSE 3000

ENTRYPOINT ["bundle", "exec"]
CMD ["rails", "server", "-p", "3000", "-b", "0.0.0.0"]
