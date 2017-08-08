FROM alpine:latest
MAINTAINER Fabien Herfray <herfray.fabien@gmail.com>

ENV GCLOUD_SDK_VERSION=165.0.0

RUN apk add --update --no-cache git openssh tar gzip ca-certificates python wget docker make
RUN wget "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GCLOUD_SDK_VERSION}-linux-x86_64.tar.gz" \
    && tar -xzf "google-cloud-sdk-${GCLOUD_SDK_VERSION}-linux-x86_64.tar.gz" \
    && rm "google-cloud-sdk-${GCLOUD_SDK_VERSION}-linux-x86_64.tar.gz" \
    && google-cloud-sdk/install.sh --usage-reporting=true --path-update=true --bash-completion=true --rc-path=/.bashrc \
    && google-cloud-sdk/bin/gcloud config set --installation component_manager/disable_update_check true \
    && rm -rf google-cloud-sdk/.install/.backup \
    && rm -rf google-cloud-sdk/.install/.download \
    && apk del wget \
    && rm -rf /var/cache/apk/*

ENV PATH=$PATH:/google-cloud-sdk/bin