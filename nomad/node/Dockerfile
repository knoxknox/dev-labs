FROM ubuntu:18.04

WORKDIR /

RUN apt-get update && \
    apt-get install -y \
    curl \
    unzip \
    iproute2 \
    gnupg-agent \
    ca-certificates \
    apt-transport-https \
    software-properties-common

# Docker Engine in docker (https://docs.docker.com/engine/install/ubuntu)
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io # install docker community edition

ADD scripts/initialize.sh .
ADD scripts/install_nomad.sh .
ADD scripts/install_consul.sh .

RUN ./install_nomad.sh
RUN ./install_consul.sh

ENTRYPOINT ./initialize.sh
