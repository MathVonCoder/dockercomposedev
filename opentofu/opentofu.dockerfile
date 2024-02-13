FROM debian:11-slim

RUN apt update -y && apt upgrade -y
RUN apt install curl -y
RUN apt install unzip -y

ARG TOFU_VERSION=1.6.1
ARG ZIPFILE=tofu_${TOFU_VERSION}_linux_amd64.zip

RUN curl -LO https://github.com/opentofu/opentofu/releases/download/v${TOFU_VERSION}/tofu_${TOFU_VERSION}_linux_amd64.zip

# get the sha
RUN curl -LO https://github.com/opentofu/opentofu/releases/download/v${TOFU_VERSION}/tofu_${TOFU_VERSION}_SHA256SUMS

# check the sha, if not good will fail docker build
RUN [ $(sha256sum "${ZIPFILE}" | cut -f 1 -d ' ') = "$(grep "${ZIPFILE}" tofu_*_SHA256SUMS | cut -f 1 -d ' ')" ] 

RUN unzip $ZIPFILE

# TODO check the sign see: https://opentofu.org/docs/intro/install/standalone/ and use cosign

ENTRYPOINT ["./tofu"]
