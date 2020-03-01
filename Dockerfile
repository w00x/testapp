FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential mlocate libpq-dev nodejs libxmlsec1-dev xvfb libfontconfig openssh-server vim
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
        && apt-get install -y nodejs
RUN mkdir /testapp

WORKDIR /testapp


COPY Gemfile /testapp/Gemfile
COPY Gemfile.lock /testapp/Gemfile.lock

RUN gem install bundler

RUN bundle install

EXPOSE 3000
#CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]