resource "aws_key_pair" "ssh" {
  key_name   = "Training_${var.name}"
  public_key = "${file("../ssh-key.pub")}"
}
