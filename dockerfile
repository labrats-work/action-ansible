# Container image that runs your code
FROM docker.io/alpine:edge

RUN apk -U upgrade
# Generic pre-req
RUN apk add curl git openssh
# Ansible pre-req
RUN apk add python3
# Ansible
RUN apk add ansible

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]