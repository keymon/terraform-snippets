resource "aws_instance" "tensorflow" {
  instance_type = "${var.instance_type}"
  ami = "${lookup(var.amis, var.region)}"
  subnet_id = "${aws_subnet.tensorflow.0.id}"
  key_name = "${aws_key_pair.env_key_pair.key_name}"
  security_groups = ["${aws_security_group.ssh-jupiter.id}"]
  source_dest_check = false
  tags = {
    Name = "${var.env}-tensorflow"
  }
}

