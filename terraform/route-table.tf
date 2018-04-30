resource "aws_default_route_table" "default" {
  default_route_table_id = "${aws_vpc.master.default_route_table_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.master.id}"
  }

  tags {
    Name        = "Training_${var.name}_RouteTable_Default"
    Environment = "${terraform.workspace}"
    Owner       = "${var.email}"
  }
}

resource "aws_route_table_association" "public_a" {
  subnet_id      = "${aws_subnet.public_a.id}"
  route_table_id = "${aws_vpc.master.default_route_table_id}"
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = "${aws_subnet.public_b.id}"
  route_table_id = "${aws_vpc.master.default_route_table_id}"
}
