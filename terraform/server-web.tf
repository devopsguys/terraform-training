locals {
  web_servers_count = "2"
}

resource "aws_instance" "web" {
  count         = "${local.web_servers_count}"
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  subnet_id     = "${element(aws_subnet.public.*.id, count.index)}"
  key_name      = "${aws_key_pair.ssh.id}"
  user_data     = "${element(data.template_file.web_init.*.rendered, count.index)}"

  associate_public_ip_address = true

  vpc_security_group_ids = [
    "${aws_security_group.web.id}",
  ]

  tags {
    Name        = "Training_${var.name}_Web${format("%02d", count.index+1)}"
    Environment = "${terraform.workspace}"
    Owner       = "${var.email}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

data "template_file" "web_init" {
  count    = "${local.web_servers_count}"
  template = "${file("server-web-init.tpl")}"

  vars {
    name   = "${var.email}"
    server = "Training_${var.name}_Web${format("%02d", count.index+1)}"
  }
}
