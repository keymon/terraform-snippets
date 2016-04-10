resource "aws_internet_gateway" "tensorflow" {
  vpc_id = "${aws_vpc.tensorflow.id}"
}

resource "aws_subnet" "tensorflow" {
  count             = 1
  vpc_id            = "${aws_vpc.tensorflow.id}"
  cidr_block        = "${lookup(var.public_cidrs, concat("zone", count.index))}"
  availability_zone = "${lookup(var.zones, concat("zone", count.index))}"
  map_public_ip_on_launch = true
  depends_on = ["aws_internet_gateway.tensorflow"]
  tags {
    Name = "${var.env}-tensorflow-subnet-${count.index}"
  }
}

resource "aws_route_table" "tensorflow" {
  vpc_id = "${aws_vpc.tensorflow.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.tensorflow.id}"
  }
}

resource "aws_route_table_association" "tensorflow" {
  count = 1
  subnet_id = "${element(aws_subnet.tensorflow.*.id, count.index)}"
  route_table_id = "${aws_route_table.tensorflow.id}"
}
