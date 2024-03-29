resource "aws_elb" "basic-web-app-elb" {
  name            = "basic-web-app-elb"
  subnets         = ["${aws_subnet.dmz_subnet_a.id}","${aws_subnet.dmz_subnet_b.id}"]
  security_groups = ["${aws_security_group.elb_security_group.id}"]
  depends_on = [
    "aws_internet_gateway.basic-web-app-gateway",
    "aws_route_table_association.route_traffic_to_dmz_a",
  ]

  listener {
    instance_port     = 80
    instance_protocol = "tcp"
    lb_port           = 80
    lb_protocol       = "tcp"
  }

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 5
    target              = "HTTP:80/"
    interval            = 6
  }
}