resource "aws_security_group" "web" {
  name        = "Training_${var.name}_Web"
  description = "For Web instances to allow SSH, HTTP(s) traffic."
  vpc_id      = "${aws_vpc.master.id}"

  tags {
    Name        = "Training_${var.name}_SecurityGroup_Web"
    Environment = "${terraform.workspace}"
    Owner       = "${var.email}"
  }
}

resource "aws_security_group_rule" "web_ssh_in" {
  security_group_id = "${aws_security_group.web.id}"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"

  # cidr_blocks              = ["0.0.0.0/0"]
  source_security_group_id = "${aws_security_group.bastion.id}"
}

resource "aws_security_group_rule" "web_http_in" {
  security_group_id = "${aws_security_group.web.id}"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"

  source_security_group_id = "${aws_security_group.alb.id}"
}

resource "aws_security_group_rule" "web_http_out" {
  security_group_id = "${aws_security_group.web.id}"
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}

resource "aws_security_group_rule" "web_https_out" {
  security_group_id = "${aws_security_group.web.id}"
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}
