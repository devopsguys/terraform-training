provider "aws" {
  region = "${var.aws_region}"

  # Fux the version of the AWS Provider
  version = "~> 1.16"
}
