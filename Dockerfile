ARG BASE_IMAGE_NAME=jenkins/jenkins
ARG BASE_IMAGE_VERSION=2.426.1-jdk17
ARG BASE_IMAGE=${BASE_IMAGE_NAME}:${BASE_IMAGE_VERSION}

FROM ${BASE_IMAGE}

USER root

RUN apt-get update \
    && apt-get install -y lsb-release \
    && curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
        https://download.docker.com/linux/debian/gpg \
    && echo "deb [arch=$(dpkg --print-architecture) \
        signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
        https://download.docker.com/linux/debian \
        $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list \
    && apt-get update \
    && apt-get install -y docker-ce-cli

USER jenkins

# TODO: see https://github.com/jenkinsci/docker/#preinstalling-plugins to
#       install plugins. I would want to install the Jenkins Configuration as
#       Code plugin.

