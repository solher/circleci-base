FROM google/cloud-sdk:alpine
RUN gcloud components install kubectl docker-credential-gcr \
    && apk add --update --no-cache docker make
COPY gcrgc.sh /usr/local/bin/gcrgc.sh
