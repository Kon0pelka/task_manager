FROM ruby:2.6.3-alpine3.8
RUN apk add --no-cache tini build-base postgresql-dev zlib-dev libxml2-dev libxslt-dev readline-dev tzdata git nodejs imagemagick \
    && echo -e 'gem: --no-document' >> /etc/gemrc
RUN apk add --update nginx && rm -rf /var/cache/apk/*

ENTRYPOINT ["/sbin/tini", "--"]
ENV RAILS_ROOT /hoddy_app
ENV RAILS_ENV production
ENV RAILS_LOG_TO_STDOUT true

RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --jobs "$(nproc)" --retry 5 --without development test
COPY . .
EXPOSE 3000
CMD bundle exec puma -C config/puma.rb
