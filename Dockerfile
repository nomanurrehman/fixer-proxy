FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y postgresql-client

# Add NodeJS to sources list
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -

# Add Yarn to the sources list
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y nodejs yarn

RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

EXPOSE 2300
ENTRYPOINT ["bundle", "exec"]