resource "aws_security_group" "ssh-jupiter" {
  name = "${var.env}-ssh-ipython"
  description = "Security group that allows SSH and jupyter traffic from the given IP"
  vpc_id = "${aws_vpc.tensorflow.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = [
      "${split(",", var.client_ips)}"
    ]
  }

  ingress {
    from_port = 8888
    to_port   = 8888
    protocol  = "tcp"
    cidr_blocks = [
      "${split(",", var.client_ips)}"
    ]
  }

  tags {
    Name = "${var.env}-ssh-ipython"
  }
}

