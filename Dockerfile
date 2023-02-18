FROM ruby:3.0.4-alpine

RUN apk add postgresql-dev gcc musl-dev make

WORKDIR /usr/application

COPY Gemfile .
COPY Gemfile.lock .

RUN gem install bundler:2.3.12
RUN bundle install

COPY . .

RUN bin/rails assets:precompile

EXPOSE 80:3000

CMD ["bin/rails", "server", "-e", "production"]
