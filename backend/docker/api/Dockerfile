FROM ruby:2.6.3

RUN apt-get update -qq && \
    apt-get install -y apt-utils \
    build-essential \
    libpq-dev \
    nodejs \
    vim \
    default-mysql-client

WORKDIR /app

ADD Gemfile .
ADD Gemfile.lock .
RUN gem install rails -v 6.0.3.6
RUN gem install bundler
RUN bundle install -j4

ADD . /app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000