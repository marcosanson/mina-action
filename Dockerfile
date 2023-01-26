# Container image that runs your code
FROM ruby:2.5.0-alpine

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Make entrypooint executable
RUN apk update && \
    apk add openssh-client && \
    gem install mina mina-multistage mina-unicorn mina-whenever && \
    chmod +x /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]