data "aws_availability_zones" "available" {}

resource "aws_subnet" "public" {
  count             = "${length(data.aws_availability_zones.available.names)}"
  vpc_id            = "${aws_vpc.master.id}"
  cidr_block        = "${cidrsubnet(aws_vpc.master.cidr_block, 8, count.index)}"
  availability_zone = "${element(data.aws_availability_zones.available.names, count.index)}"

  tags {
    Name        = "Training_${var.name}_Public${format("%02d", count.index+1)}"
    Environment = "${terraform.workspace}"
    Owner       = "${var.email}"
  }
}
