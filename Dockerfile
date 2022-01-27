FROM ubuntu:21.04

ARG PACKAGES="python \
              python3-pip \
              s3fs \
              vim"

ENV s3cmd="s3cmd==2.2.0"

USER root

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y ${PACKAGES} && \
    pip install ${s3cmd} && \
    # CleanUp Container
    apt clean autoclean && \
    apt autoremove --yes && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/*