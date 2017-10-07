resource "aws_iam_user" "s3_resource_test_bucket_user" {
  name = "s3_resource_test_bucket_user"
}

resource "aws_iam_access_key" "s3_resource_test_bucket_user_key" {
  user    = "s3_resource_test_bucket_user"
  pgp_key = "${var.pgp_key}"
}

resource "aws_iam_role" "s3_resource_test_bucket_role" {
  name               = "s3_resource_test_bucket_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      },
      "Action": "sts:AssumeRole",
      "Condition" : {
        "IpAddress" : {
          "aws:SourceIp" : ${jsonencode(var.allowed_ips)}
        }
      }
    }
  ]
}
EOF
}
