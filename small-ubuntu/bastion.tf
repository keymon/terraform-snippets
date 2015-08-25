resource "aws_instance" "bastion" {
  instance_type = "t2.micro"
  ami = "${lookup(var.amis, var.region)}"
  subnet_id = "${aws_subnet.bastion.0.id}"
  key_name = "${var.key_pair_name}"
  security_groups = ["${aws_security_group.bastion.id}"]
  source_dest_check = false
  tags = {
    Name = "${var.env}-bastion"
  }
}

