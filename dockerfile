FROM ubuntu:18.04
RUN apt-get update && apt-get install -y curl
USER root
RUN echo "root ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

