FROM ruby:2.5-alpine

ADD terraform_0.11.7_SHA256SUMS /

RUN apk --no-cache --no-progress add curl unzip \
  && curl -O https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip \
  && sha256sum -c terraform_0.11.7_SHA256SUMS \
  && unzip -d /usr/local/bin terraform_0.11.7_linux_amd64.zip \
  && rm terraform_0.11.7_linux_amd64.zip \
  && rm terraform_0.11.7_SHA256SUMS \
  && apk del curl unzip
