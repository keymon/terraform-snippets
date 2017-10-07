data "template_file" "s3_resource_aws_config_sh" {
  template = <<EOF

# AWS config to test the s3-resource
export S3_TESTING_USER_NAME="${aws_iam_user.s3_resource_test_bucket_user.name}";
export S3_TESTING_ACCESS_KEY_ID="${aws_iam_access_key.s3_resource_test_bucket_user_key.id}";
export S3_TESTING_SECRET_ACCESS_KEY="$(echo "${aws_iam_access_key.s3_resource_test_bucket_user_key.encrypted_secret}" | base64 -D | gpg -d)";
export S3_TESTING_BUCKET="${aws_s3_bucket.s3_resource_test_bucket_no_version.id}"
export S3_VERSIONED_TESTING_BUCKET="${aws_s3_bucket.s3_resource_test_bucket_version.id}"
export S3_TESTING_REGION="${var.aws_default_region}"
export S3_ENDPOINT="https://s3-${var.aws_default_region}.amazonaws.com"
EOF
}

output "s3_resource_aws_config_sh" {
  value = "${data.template_file.s3_resource_aws_config_sh.rendered}"
}

output "s3_resource_test_bucket_no_version" {
  value = "${aws_s3_bucket.s3_resource_test_bucket_no_version.arn}"
}

output "s3_resource_test_bucket_version" {
  value = "${aws_s3_bucket.s3_resource_test_bucket_version.arn}"
}
