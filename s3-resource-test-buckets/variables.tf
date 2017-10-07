variable "aws_default_region" {
    default = "eu-west-1"
}

variable "aws_account_id" {
    description = "Root account id"
}

variable "pgp_key" {
    description = "PGP Key to encrypt the test user creds"
}

variable "allowed_ips" {
  description = "List of IPs allowed to operate with these accounts"
  type        = "list"
}
