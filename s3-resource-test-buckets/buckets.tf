resource "aws_s3_bucket" "s3_resource_test_bucket_no_version" {
  bucket = "s3-resource-test-bucket-no-version-${substr(sha1(data.aws_caller_identity.current.account_id), 0, 8)}"
  acl    = "private"
}

resource "aws_s3_bucket" "s3_resource_test_bucket_version" {
  bucket = "s3-resource-test-bucket-version-${substr(sha1(data.aws_caller_identity.current.account_id), 0, 8)}"
  acl    = "private"
}
