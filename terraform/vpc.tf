resource "aws_vpc" "master" {
  cidr_block = "10.197.0.0/16"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name        = "Training_${var.name}_VPC"
    Environment = "${terraform.workspace}"
    Owner       = "${var.email}"
  }
}
