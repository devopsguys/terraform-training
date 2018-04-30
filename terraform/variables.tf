variable "aws_region" {
  description = "AWS region within which to host the environment"
  default     = "eu-west-2"
}

variable "name" {
  description = "Name of the person creating this infrastructure"
  default     = "JonathanWright"
}

variable "email" {
  description = "Email of the person creating this infrastructure"
  default     = "jonathan.wright@devopsguys.com"
}
