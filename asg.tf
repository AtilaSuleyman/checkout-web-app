resource "aws_launch_template" "web_app_launch_template" {
  name_prefix            = "example"
  image_id               = "junk-value"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["${aws_security_group.asg_instance_security_group.id}"]
}

resource "aws_autoscaling_group" "web_app_asg" {
  name                      = "example_asg"
  max_size                  = 3
  min_size                  = 1
  desired_capacity          = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  vpc_zone_identifier       = ["${aws_subnet.app_subnet_a.id}", "${aws_subnet.app_subnet_b.id}"]
  load_balancers            = ["${aws_elb.example_elb.id}"]

  launch_template {
    id      = "${aws_launch_template.web_app_launch_template.id}"
    version = "$$Latest"
  }
}