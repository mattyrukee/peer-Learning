FROM ubuntu:18.04

# Running as root (MEDIUM/HIGH)
USER root

# Installing packages without version pinning (MEDIUM)
RUN apt-get update && apt-get install -y curl wget

# Using latest tag (best practice violation)
FROM node:latest

# Running container as root (HIGH)
USER root

# Exposing all ports (MEDIUM)
EXPOSE 0-65535

# No healthcheck (MEDIUM)
# Copying secrets directly (HIGH if secrets exist)
COPY . /app

WORKDIR /app
CMD ["node", "app.js"]
