resource "aws_security_group" "bosh-lite" {
  name = "${var.env}-lite"
  description = "Security group for bosh-lite that allows SSH traffic from the office"
  vpc_id = "${aws_vpc.default.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    self = true
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["${split(",", var.office_cidrs)}"]
  }

  ingress {
    self = true
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["${split(",", var.office_cidrs)}"]
  }

  ingress {
    self = true
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["${split(",", var.office_cidrs)}"]
  }

  ingress {
    self = true
    from_port = 4443
    to_port   = 4443
    protocol  = "tcp"
    cidr_blocks = ["${split(",", var.office_cidrs)}"]
  }

  ingress {
    self = true
    from_port = 25555
    to_port   = 25555
    protocol  = "tcp"
    cidr_blocks = ["${split(",", var.office_cidrs)}"]
  }

  tags {
    Name = "${var.env}-bosh-lite"
  }
}

