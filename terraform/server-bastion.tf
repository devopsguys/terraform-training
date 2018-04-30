resource "aws_instance" "bastion" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.public.0.id}"
  key_name      = "${aws_key_pair.ssh.id}"

  vpc_security_group_ids = [
    "${aws_security_group.bastion.id}",
  ]

  tags {
    Name        = "Training_${var.name}_Bastion"
    Environment = "${terraform.workspace}"
    Owner       = "${var.email}"
  }
}

resource "aws_eip" "bastion" {
  vpc      = true
  instance = "${aws_instance.bastion.id}"
}
