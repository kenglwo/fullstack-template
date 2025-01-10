FROM ruby:3.4.1-bookworm
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /backend
COPY Gemfile Gemfile.lock ./
# COPY .env.development ./.env.development
RUN bundle config set force_ruby_platform true
RUN bundle install 

ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo

EXPOSE ${PORT_BACKEND}
ENTRYPOINT ["/bin/sh", "docker-entrypoint.sh"]