Setup AWS bosh-lite dependencies
================================

Setups the minimum elements to run [`bosh-lite`](https://github.com/cloudfoundry/bosh-lite)

Usage:

 1. Run terraform: `terraform apply`
 2. Generate the needed environment variables:

    ```
# Region to use
export AWS_DEFAULT_REGION=eu-west-1

# Your AWS credentials
export BOSH_AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export BOSH_AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY

# SSH key, you should have uploaded before
export BOSH_LITE_KEYPAIR=insecure-deployer
export BOSH_LITE_PRIVATE_KEY=~/.ssh/insecure-deployer

# Environment specifics
export BOSH_LITE_NAME=${USER}boshlite
export BOSH_LITE_SECURITY_GROUP=`terraform output bosh-lite-sg`
export BOSH_LITE_SUBNET_ID=`terraform output bosh-lite-subnet`
```

 3. Use [`bosh-lite`](https://github.com/cloudfoundry/bosh-lite) in AWS:

    ```
cd ~/workspace
git clone https://github.com/cloudfoundry/bosh-lite.git
cd ~/workspace/bosh-lite
vagrant up --provider=aws
```

Now you can use `bosh-lite` to deploy for instance CF:

```
vagrant ssh

# Install spiff
wget https://github.com/cloudfoundry-incubator/spiff/releases/download/v1.0.7/spiff_linux_amd64.zip
unzip spiff_linux_amd64.zip
sudo cp spiff /usr/local/bin %% sudo chmod +x /usr/local/bin/spiff

# Install cf client
wget 'https://cli.run.pivotal.io/stable?release=debian64&version=6.12.3&source=github-rel' -O cf_cli.deb
sudo dpkg -i cf_cli.deb

# Install some dependencies
sudo apt-get update && apt-get install -y git unzip


# Clone the release
git clone https://github.com/cloudfoundry/cf-release ~/cf-release
# cd ~/cf-release && ./update

# Clone bosh-lite (to use the script to deploy CF)
git clone https://github.com/cloudfoundry/bosh-lite.git ~/bosh-lite
cd ~/bosh-lite

# Setup bosh and deploy CF
bosh target localhost
bosh status

BOSH_UUID=$(bosh status --uuid)
gsed -i "s/PLACEHOLDER-DIRECTOR-UUID/$BOSH_UUID/;" manifests/cf-stub-spiff.yml
bin/provision_cf
```

Now you can deploy an app:
```
# Login in CF, create a org+space, etc
cf api --skip-ssl-validation https://api.10.244.0.34.xip.io
cf login
cf create-org me
cf target -o me
cf create-space development
cf target -o me -s development


# Deploy an app
sudo apt-get install -y openjdk-7-jdk
git clone https://github.com/cloudfoundry-samples/spring-music.git ~/spring-music
cd ~/spring-music
./gradlew assemble
cf push
```

