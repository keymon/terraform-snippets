Terraform for buckets to test concourse s3-resource
---------------------------------------------------

This terraform definition would create the resorurces to test
the [concourse-s3-resource](https://github.com/concourse/s3-resource)

Based on the boilerplate: https://github.com/keymon/terraform_boilerplate

Here we create:
 - 2x buckets, with and without version:
 - User with a AWS Access Key able to access the bucket
 - Role able access the bucket, that can be assumed by the previous user.


