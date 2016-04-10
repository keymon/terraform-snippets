output "myhost" {
  value = "${aws_instance.tensorflow.public_ip}"
}

