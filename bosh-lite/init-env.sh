#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $BASH_SOURCE) && pwd)

[ $BASH_SOURCE == $0 ] && NOP=echo

pushd $SCRIPT_DIR > /dev/null

# Region to use
$NOP export AWS_DEFAULT_REGION=us-east-1

# Your AWS credentials
$NOP export BOSH_AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
$NOP export BOSH_AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY

# SSH key, you should have uploaded before
$NOP export BOSH_LITE_KEYPAIR=insecure-deployer
$NOP export BOSH_LITE_PRIVATE_KEY=~/.ssh/insecure-deployer

# Environment specifics
$NOP export BOSH_LITE_NAME=${USER}boshlite
$NOP export BOSH_LITE_SECURITY_GROUP=`terraform output bosh-lite-sg`
$NOP export BOSH_LITE_SUBNET_ID=`terraform output bosh-lite-subnet`

popd > /dev/null
