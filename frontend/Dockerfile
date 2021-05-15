FROM node:12.16.1

RUN apt update -y && \
  apt upgrade -y && \
  apt install -y ca-certificates python-pip && \
  pip install awscli && \
  apt clean && \
  rm -rf /var/lib/apt/lists/*
