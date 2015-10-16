output "bosh-lite-sg" {
  value = "${aws_security_group.bosh-lite.id}"
}
output "bosh-lite-subnet" {
  value = "${aws_subnet.bosh-lite.id}"
}
output "env" {
  value = "${var.env}"
}

