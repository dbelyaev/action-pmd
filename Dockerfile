FROM alpine:3.18

ENV REVIEWDOG_VERSION=v0.15.0

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

# hadolint ignore=DL3006
RUN apk --no-cache add git

# install reviewdog tool
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

# TODO: Install a linter and/or change docker image as you need.
RUN wget -q https://github.com/pmd/pmd/releases/download/pmd_releases%2F7.0.0-rc3/pmd-dist-7.0.0-rc3-bin.zip \
 && unzip pmd-dist-7.0.0-rc3-bin.zip

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
