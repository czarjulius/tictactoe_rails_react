FROM ruby:2.6.3

RUN mkdir /tictactoe

WORKDIR /tictactoe
RUN apt-get update && apt-get install -y \
  curl \
  build-essential \
  libpq-dev &&\
  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn

COPY yarn.lock ./
COPY Gemfile* ./
COPY package.json ./
COPY . .

RUN gem install bundler && bundle install
RUN bundle update rake
RUN yarn install
CMD bundle exec rails server -b 0.0.0.0
