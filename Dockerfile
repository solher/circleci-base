FROM google/cloud-sdk:alpine
RUN gcloud components install kubectl
RUN apk add --update --no-cache docker make
# RUN apk add --update --no-cache git openssh tar gzip ca-certificates python wget docker make
