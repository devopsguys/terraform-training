output "region" {
  description = "Name of the AWS Region we are working in"
  value       = "${var.aws_region}"
}

output "environment" {
  description = "Name of the Terraform Workspace"
  value       = "${terraform.workspace}"
}

output "bastion_public_ip" {
  description = "Public IP address for the Bastion Server"
  value       = "0.0.0.0"
}

output "ami_id" {
  description = "AMI ID of for Ubuntu 16.04 LTS in the current region."
  value       = "${data.aws_ami.ubuntu.id}"
}
