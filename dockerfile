FROM ruby:3.0
RUN  curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get update \
    && apt-get install -y nodejs postgresql-client \
    && npm install -g yarn

COPY Gemfile .
COPY Gemfile.lock .
WORKDIR /app
RUN bundle install
