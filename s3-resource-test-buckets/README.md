Terraform for buckets to test concourse s3-resource
---------------------------------------------------

This terraform definition would create the resorurces to test
the [concourse-s3-resource](https://github.com/concourse/s3-resource)

Based on the boilerplate: https://github.com/keymon/terraform_boilerplate

Here we create:
 - 2x buckets, with and without version:
 - User with a AWS Access Key able to access the bucket
 - Role able access the bucket, that can be assumed by the previous user.

Running the s3-resource tests with this:
-------------------------------

Based on the test instructions https://github.com/concourse/s3-resource#integration-tests

Copy the output of:

```
./run-terraform.sh output s3_resource_aws_config_sh

```

To a file `/tmp/s3-resource-aws-config.sh`

Then, in the s3-resource run:

```
. /tmp/s3-resource-aws-config.sh
docker build . -t s3-resource \
	--build-arg S3_TESTING_ACCESS_KEY_ID="${S3_TESTING_ACCESS_KEY_ID}" \
	--build-arg S3_TESTING_SECRET_ACCESS_KEY="${S3_TESTING_SECRET_ACCESS_KEY}" \
	--build-arg S3_TESTING_BUCKET="${S3_TESTING_BUCKET}" \
	--build-arg S3_VERSIONED_TESTING_BUCKET="${S3_VERSIONED_TESTING_BUCKET}" \
	--build-arg S3_TESTING_REGION="${S3_TESTING_REGION}" \
	--build-arg S3_ENDPOINT="${S3_ENDPOINT}"
```
