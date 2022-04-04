FROM harbor.octanner.io/developer/rubychrome:2.7.2-97.0

RUN apt-get update \
  && apt-get install -y --no-install-recommends libkrb5-dev python python3-pip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade setuptools==41.2.0
RUN pip install awscli==1.16.247

RUN bundle config --global frozen 1

WORKDIR /gems
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN NOKOGIRI_USE_SYSTEM_LIBRARIES=true bundle install

ENV APP_DIR /app

WORKDIR /app
ADD . /app

EXPOSE 80

CMD ./start.sh
