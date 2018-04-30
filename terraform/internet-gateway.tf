resource "aws_internet_gateway" "master" {
  vpc_id = "${aws_vpc.master.id}"

  tags {
    Name        = "Training_${var.name}_IGW"
    Environment = "${terraform.workspace}"
    Owner       = "${var.email}"
  }
}
