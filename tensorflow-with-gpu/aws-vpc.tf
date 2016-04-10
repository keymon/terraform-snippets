provider "aws" {
  region      = "${var.region}"
}

resource "aws_vpc" "tensorflow" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags {
    Name = "${var.env}-vpc"
  }
}
