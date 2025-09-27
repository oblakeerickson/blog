# Dockerfile
FROM ruby:2.6.6-slim

ENV DEBIAN_FRONTEND=noninteractive LANG=C.UTF-8 LC_ALL=C.UTF-8

# Fix EOL apt sources (buster) + install deps
RUN set -eux; \
  sed -i -e 's|deb.debian.org|archive.debian.org|g' \
         -e 's|security.debian.org|archive.debian.org|g' \
         -e 's|buster-updates|buster|g' /etc/apt/sources.list; \
  printf 'Acquire::Check-Valid-Until "false";\n' > /etc/apt/apt.conf.d/99no-check-valid; \
  apt-get update; \
  apt-get install -y --no-install-recommends \
    build-essential git ca-certificates curl \
    zlib1g-dev libffi-dev libyaml-dev libgdbm-dev libreadline-dev \
    libncurses5-dev libssl-dev pkg-config tzdata; \
  rm -rf /var/lib/apt/lists/*

# Match server toolchain closely (optional but nice)
RUN gem update --system 3.0.3 \
 && gem install bundler:1.16.1 bundler:2.1.2

ENV BUNDLE_PATH=/usr/local/bundle BUNDLE_JOBS=4 BUNDLE_RETRY=3
WORKDIR /site

CMD ["bash", "-lc", "bundle _1.16.1_ install && bundle _1.16.1_ exec jekyll serve --host 0.0.0.0 --port 4000 --watch"]
