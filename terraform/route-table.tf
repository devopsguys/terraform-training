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

resource "aws_route_table_association" "public" {
  count          = "${length(data.aws_availability_zones.available.names)}"
  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_vpc.master.default_route_table_id}"
}
