FROM ruby:3.0

WORKDIR /app
COPY Gemfile* .

RUN  curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get update \
    && apt-get install -y nodejs postgresql-client \
    && npm install -g yarn

RUN bundle install

CMD ["rails", "server", "-b", "0.0.0.0"]
