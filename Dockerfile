FROM ruby:2.4

RUN apt-get install -y libffi-dev

COPY . /code
WORKDIR /code

RUN bundle install
CMD bundle exec middleman server
