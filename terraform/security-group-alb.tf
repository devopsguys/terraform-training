resource "aws_security_group" "alb" {
  name        = "Training_${var.name}_LoadBalancer"
  description = "For AWS ELB to allow HTTP(s) traffic."
  vpc_id      = "${aws_vpc.master.id}"

  tags {
    Name        = "Training_${var.name}_SecurityGroup_LoadBalancer"
    Environment = "${terraform.workspace}"
    Owner       = "${var.email}"
  }
}

resource "aws_security_group_rule" "alb_http_in" {
  security_group_id = "${aws_security_group.alb.id}"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}

resource "aws_security_group_rule" "alb_https_in" {
  security_group_id = "${aws_security_group.alb.id}"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}

resource "aws_security_group_rule" "alb_http_out" {
  security_group_id = "${aws_security_group.alb.id}"
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"

  source_security_group_id = "${aws_security_group.web.id}"
}
