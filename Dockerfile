FROM ruby:2.6.6-slim

ENV DEBIAN_FRONTEND=noninteractive LANG=C.UTF-8 LC_ALL=C.UTF-8

# Fix old Debian repos
RUN sed -i -e 's|deb.debian.org|archive.debian.org|g' \
           -e 's|security.debian.org|archive.debian.org|g' \
           -e 's|buster-updates|buster|g' /etc/apt/sources.list && \
    printf 'Acquire::Check-Valid-Until "false";\n' > /etc/apt/apt.conf.d/99no-check-valid && \
    apt-get update && apt-get install -y --no-install-recommends \
      build-essential git ca-certificates curl \
      zlib1g-dev libffi-dev libyaml-dev libgdbm-dev libreadline-dev \
      libncurses5-dev libssl-dev pkg-config tzdata && \
    rm -rf /var/lib/apt/lists/*

# Install bundler versions
RUN gem update --system 3.0.3 && gem install -N bundler:1.16.1 bundler:2.1.2

# Default envs so you don’t have to pass them
ENV HOME=/tmp \
    GEM_HOME=/site/vendor/bundle \
    GEM_PATH=/site/vendor/bundle \
    BUNDLE_PATH=/site/vendor/bundle \
    BUNDLE_APP_CONFIG=/site/.bundle \
    PATH="/site/vendor/bundle/bin:$PATH"

WORKDIR /site

# Default command: install gems and run jekyll
CMD ["bash","-lc","bundle _1.16.1_ install && bundle _1.16.1_ exec jekyll serve --host 0.0.0.0 --port 4000 --drafts --watch"]
