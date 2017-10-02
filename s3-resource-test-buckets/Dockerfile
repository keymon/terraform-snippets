FROM python:3-alpine

ENV TERRAFORM_VERSION=0.10.7
ENV AWSCLI_VERSION=1.11.162

RUN apk add --no-cache --update ca-certificates openssl curl && \
	wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
	unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin/ && \
	rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
        pip install awscli==${AWSCLI_VERSION}
