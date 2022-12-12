FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y build-essential postgresql libpq-dev
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN bundle install

RUN gem install nokogiri
RUN gem install sidekiq
RUN gem install rubocop

#ENTRYPOINT ["bin/rails"]
#CMD ["s", "-b", "0.0.0.0"]
#EXPOSE 3000