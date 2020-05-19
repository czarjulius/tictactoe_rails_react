FROM ruby:2.6.3-alpine

RUN mkdir /tictactoe

WORKDIR /tictactoe

COPY Gemfile /tictactoe/Gemfile
COPY Gemfile.lock /tictactoe/Gemfile.lock
RUN gem install bundler && bundle install


COPY . /tictactoe

CMD bundle exec rails server