#!/bin/sh

cd $(dirname $0)

ENV_NAME=${USER}
if [ -f 'terraform.tfstate' ]; then
	ENV_NAME=$(terraform output env)
fi
CURRENT_IP=$(wget http://ipinfo.io/ip -qO -)

terraform apply -var office_cidrs=${CURRENT_IP}/32,80.194.77.90/32,80.194.77.100/32 -var env=${ENV_NAME}

