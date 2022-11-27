# Container image that runs your code
FROM docker.io/labratswork/ops-images-ansible:latest

LABEL org.opencontainers.image.authors="tompisula@labrats.work"

ENV ANSIBLE_FORCE_COLOR=0

COPY tests /tests

COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]