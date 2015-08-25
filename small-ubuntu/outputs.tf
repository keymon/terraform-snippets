output "myhost" {
  value = "${aws_instance.bastion.public_ip}"
}

