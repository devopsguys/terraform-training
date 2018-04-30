terraform {
  backend "s3" {
    bucket               = "devopsguys-platform-terraform-state-eu-west-2"
    workspace_key_prefix = "environments"
    key                  = "training/JonathanWright-20180502.tfstate"
    region               = "eu-west-2"                                     # London
    encrypt              = "true"
    dynamodb_table       = "devopsguys-platform-terraform-lock"
    acl                  = "bucket-owner-read"
  }
}
