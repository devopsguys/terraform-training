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
