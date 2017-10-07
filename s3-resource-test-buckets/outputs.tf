data "template_file" "credentials_sh" {
  template = <<EOF

# AWS Credentials for the user ${aws_iam_user.s3_resource_test_bucket_user.name}
export AWS_USER_NAME="${aws_iam_user.s3_resource_test_bucket_user.name}";
export AWS_ACCESS_KEY_ID="${aws_iam_access_key.s3_resource_test_bucket_user_key.id}";
export AWS_SECRET_ACCESS_KEY="$(echo "${aws_iam_access_key.s3_resource_test_bucket_user_key.encrypted_secret}" | base64 -D | gpg -d)";
EOF
}

output "credentials_sh" {
  value = "${data.template_file.credentials_sh.rendered}"
}
