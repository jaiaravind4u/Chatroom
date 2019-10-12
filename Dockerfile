FROM ruby:2.6.3-stretch

COPY . /chatroom
WORKDIR /chatroom

# Install gems
RUN bundle install

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    apt-get install nodejs

ENV RAILS_ENV production

ENTRYPOINT ./entrypoint.sh


