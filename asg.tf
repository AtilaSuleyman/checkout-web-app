resource "aws_launch_template" "web_app_launch_template" {
  name                   = "basic-web-app-lt"
  image_id               = "ami-04de2b60dd25fbb2e"
  instance_type          = "t2.micro"

  vpc_security_group_ids = ["${aws_security_group.asg_instance_security_group.id}"]
  user_data = "${base64encode(file("init.sh"))}"
}

resource "aws_autoscaling_group" "web_app_asg" {
  name                      = "example_asg"
  max_size                  = 2
  min_size                  = 1
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  vpc_zone_identifier       = ["${aws_subnet.app_subnet_a.id}"]
  load_balancers            = ["${aws_elb.basic-web-app-elb.id}"]

  launch_template {
    id      = "${aws_launch_template.web_app_launch_template.id}"
    version = "$$Latest"
  }

  tags = {
    key = "Name"
    value = "basic-web-app"
    propagate_at_launch = true
  }
}