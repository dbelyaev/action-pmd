FROM openjdk:17-alpine

ENV REVIEWDOG_VERSION=v0.15.0
ENV PMD_VERSION=7.0.0-rc4

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

# hadolint ignore=DL3006
RUN apk --no-cache add git

# install reviewdog tool
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

# install pmd
RUN wget -q https://github.com/pmd/pmd/releases/download/pmd_releases%2F${PMD_VERSION}/pmd-dist-${PMD_VERSION}-bin.zip \
    && unzip pmd-dist-${PMD_VERSION}-bin.zip \
    && rm pmd-dist-${PMD_VERSION}-bin.zip \
    && mkdir /usr/local/bin/pmd \
    && mv pmd-bin-${PMD_VERSION}/** /usr/local/bin/pmd \
    && rm -r pmd-bin-${PMD_VERSION}

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
