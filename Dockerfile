FROM phusion/passenger-full:latest

EXPOSE 80

ENV APP_HOME /app

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
RUN bash -lc 'rvm --default use ruby-2.3'

# nginx confs
RUN rm -f /etc/service/nginx/down

# Remove the default site
RUN rm /etc/nginx/sites-enabled/default
ADD webapp.conf /etc/nginx/sites-enabled/webapp.conf
ADD rails-env.conf /etc/nginx/main.d/rails-env.conf

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN bundle install

ADD . /app
RUN chown -R app:app /app
