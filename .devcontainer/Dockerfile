FROM mcr.microsoft.com/devcontainers/cpp:1-ubuntu-24.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       build-essential \
       cmake \
       ninja-build \
       git \
       curl \
       jq \
       shellcheck \
       python3 \
       python3-pip \
       python3-venv \
       python3-yaml \
    && rm -rf /var/lib/apt/lists/*
