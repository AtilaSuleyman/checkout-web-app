resource "aws_security_group" "elb_security_group" {
  name   = "elb-security-group"
  vpc_id = "${aws_vpc.vpc_for_web_app.id}"
}

resource "aws_security_group" "asg_instance_security_group" {
  name   = "asg_instance-security-group"
  vpc_id = "${aws_vpc.vpc_for_web_app.id}"
}

# Rules on ASG security group
resource "aws_security_group_rule" "asg_in" {
  type = "ingress"
  from_port = 80
  to_port   = 80
  protocol  = "tcp"

  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.asg_instance_security_group.id}"
}

resource "aws_security_group_rule" "asg_out" {
  type = "egress"
  from_port = 80
  to_port   = 80
  protocol  = "tcp"

  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.asg_instance_security_group.id}"
}

# Rules on ELB security group
resource "aws_security_group_rule" "elb_to_asg_instances" {
  type = "egress"
  from_port = 80
  to_port   = 80
  protocol  = "tcp"

  source_security_group_id = "${aws_security_group.asg_instance_security_group.id}"
  security_group_id        = "${aws_security_group.elb_security_group.id}"
}

resource "aws_security_group_rule" "elb_in" {
  type = "ingress"
  from_port = 80
  to_port   = 80
  protocol  = "tcp"

  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.elb_security_group.id}"
}