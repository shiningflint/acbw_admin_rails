FROM ruby:2.5.1-alpine
RUN apk add --update build-base postgresql-dev tzdata nodejs yarn
RUN mkdir /app \
    &&  gem install rails -v '5.1.4'
COPY Gemfile /app/
COPY Gemfile.lock /app/
WORKDIR /app
RUN bundle install

COPY . /app/

RUN rake assets:precompile \
    && ln -sf /dev/stdout /app/log/production.log

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
