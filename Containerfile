ARG platform=linux/amd64
ARG RUBY_VERSION=4.0.1
ARG PLATFORM=slim-trixie

FROM --platform=${platform} docker.io/library/ruby:${RUBY_VERSION}-${PLATFORM} AS base
ENV APP_ROOT=/rails
ARG UID=${UID}
ARG GID=${GID}
ARG BUNDLER_VERSION=4.0.6
ARG RUBYGEMS_VERSION=4.0.6

WORKDIR $APP_ROOT

RUN apt-get -y -qq update \
    && apt-get -y -qq upgrade \
    && apt-get install --no-install-recommends -y -qq \
        build-essential=12.12 \
        curl=8.14.1-2+deb13u2 \
        graphviz=2.42.4-3 \
        libpq-dev=17.8-0+deb13u1 \
        libyaml-dev=0.2.5-2 \
        libvips42t64=8.16.1-1+b1 \
        postgresql-client=17+278 \
        < /dev/null > /dev/null
RUN gem install bundler:${BUNDLER_VERSION} \
    && gem update --system ${RUBYGEMS_VERSION}
    
RUN apt-get autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

FROM base AS dev

ENV PATH=$PATH:$APP_ROOT/vendor/bundle/bin \
  BUNDLE_SILENCE_ROOT_WARNING=1 \
  GEM_HOME=vendor/bundle \
  LANG=C.UTF-8

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb", "-p", "3000"]