resource "aws_elb" "example_elb" {
  name            = "example-elb"
  subnets         = ["${aws_subnet.dmz_subnet_a.id}", "${aws_subnet.dmz_subnet_b.id}"]
  security_groups = ["${aws_security_group.elb_security_group.id}"]

  listener {
    instance_port     = 443
    instance_protocol = "tcp"
    lb_port           = 443
    lb_protocol       = "tcp"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:443"
    interval            = 30
  }
}