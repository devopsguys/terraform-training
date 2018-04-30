resource "aws_subnet" "public_a" {
  vpc_id            = "${aws_vpc.master.id}"
  cidr_block        = "10.197.11.0/24"
  availability_zone = "${var.aws_region}a"

  tags {
    Name        = "Training_${var.name}_Subnet_PublicA"
    Environment = "${terraform.workspace}"
    Owner       = "${var.email}"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id            = "${aws_vpc.master.id}"
  cidr_block        = "10.197.13.0/24"
  availability_zone = "${var.aws_region}b"

  tags {
    Name        = "Training_${var.name}_Subnet_PublicB"
    Environment = "${terraform.workspace}"
    Owner       = "${var.email}"
  }
}
