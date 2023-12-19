FROM harbor.octanner.io/base/rubychrome:3.1-112.0-1.5

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
ARG OCT_VAULT_OPS_GITHUB_BUILD_USER=${OCT_VAULT_OPS_GITHUB_BUILD_USER:-obertbot}
ARG DEFAULT_BUNDLE_PKG_GITHUB=$OCT_VAULT_OPS_GITHUB_BUILD_USER:$OCT_VAULT_OPS_GITHUB_BUILD_TOKEN
ARG BUNDLE_RUBYGEMS__PKG__GITHUB__COM=${BUNDLE_RUBYGEMS__PKG__GITHUB__COM:-$DEFAULT_BUNDLE_PKG_GITHUB}
RUN NOKOGIRI_USE_SYSTEM_LIBRARIES=true bundle install

ENV APP_DIR /app

WORKDIR /app
ADD . /app

EXPOSE 80

CMD ./start.sh
