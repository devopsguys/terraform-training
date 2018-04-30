resource "aws_lb" "web" {
  name            = "training-${lower(var.name)}-public"
  security_groups = ["${aws_security_group.alb.id}"]

  subnets = [
    "${aws_subnet.public.*.id}",
  ]

  tags {
    Name        = "Training_${var.name}_LoadBalancer"
    Environment = "${terraform.workspace}"
    Owner       = "${var.email}"
  }
}

resource "aws_lb_listener" "web_http" {
  load_balancer_arn = "${aws_lb.web.arn}"
  port              = "80"

  default_action {
    target_group_arn = "${aws_lb_target_group.web_http.arn}"
    type             = "forward"
  }
}

resource "aws_lb_target_group" "web_http" {
  name     = "web-servers-http"
  vpc_id   = "${aws_vpc.master.id}"
  protocol = "HTTP"
  port     = 80
}

resource "aws_lb_target_group_attachment" "web_http" {
  count            = "${local.web_servers_count}"
  target_group_arn = "${aws_lb_target_group.web_http.arn}"
  target_id        = "${element(aws_instance.web.*.id,count.index)}"
  port             = 80
}
