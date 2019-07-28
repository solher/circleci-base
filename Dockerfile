FROM google/cloud-sdk:alpine
RUN gcloud components install kubectl docker-credential-gcr \
    && apk add --update --no-cache coreutils docker make \
    && rm -rf /var/cache/apk/*
COPY gcrgc.sh /usr/local/bin/gcrgc.sh
