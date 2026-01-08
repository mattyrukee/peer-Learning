FROM ubuntu:18.04

# 1. Running as root (MEDIUM → escalates depending on policy)
USER root

# 2. Installing packages without pinning versions
RUN apt-get update && apt-get install -y curl wget

# 3. Writing insecure sudo rule (HIGH severity)
RUN echo "root ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# 4. Using latest tag implicitly via base image (best-practice violation)

