resource "aws_iam_policy" "S3ResourceTestBucketPolicies" {
  name        = "S3ResourceTestBucketPolicies"
  description = "Policy"
  path        = "/test/"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": [
      "s3:ListBucket",
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:GetObject",
      "s3:GetObjectAcl",
      "s3:DeleteObject",
      "s3:DeleteObjectVersion",
      "s3:ListBucketVersions",
      "s3:GetBucketVersioning",
      "s3:GetObjectVersion",
      "s3:PutObjectVersionAcl"
    ],
    "Resource": [
      "${aws_s3_bucket.s3_resource_test_bucket_no_version.arn}/*",
      "${aws_s3_bucket.s3_resource_test_bucket_version.arn}/*",
      "${aws_s3_bucket.s3_resource_test_bucket_no_version.arn}",
      "${aws_s3_bucket.s3_resource_test_bucket_version.arn}"
    ],
    "Condition" : {
      "IpAddress" : {
        "aws:SourceIp" : ${jsonencode(var.allowed_ips)}
      }
    }
  }
}
EOF
}

resource "aws_iam_policy" "AssumeRoleS3ResourceTestBucketRole" {
  name        = "AssumeRoleS3ResourceTestBucketRole"
  description = "Policy"
  path        = "/test/"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": [
      "sts:AssumeRole"
    ],
    "Resource": [
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/s3_resource_test_bucket_role"
    ]
  }
}
EOF
}

resource "aws_iam_role_policy_attachment" "role_bucket_access" {
  role       = "${aws_iam_role.s3_resource_test_bucket_role.name}"
  policy_arn = "${aws_iam_policy.S3ResourceTestBucketPolicies.arn}"
}

resource "aws_iam_user_policy_attachment" "user_bucket_access" {
  user       = "${aws_iam_user.s3_resource_test_bucket_user.name}"
  policy_arn = "${aws_iam_policy.S3ResourceTestBucketPolicies.arn}"
}

resource "aws_iam_user_policy_attachment" "user_assume_role" {
  user       = "${aws_iam_user.s3_resource_test_bucket_user.name}"
  policy_arn = "${aws_iam_policy.AssumeRoleS3ResourceTestBucketRole.arn}"
}
