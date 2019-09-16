resource "aws_subnet" "dmz_subnet_a" {
  cidr_block = "${cidrsubnet(aws_vpc.vpc_for_web_app.cidr_block,2,0)}"
  vpc_id = "${aws_vpc.vpc_for_web_app.id}"
}

resource "aws_subnet" "dmz_subnet_b" {
  cidr_block = "${cidrsubnet(aws_vpc.vpc_for_web_app.cidr_block,2,1)}"
  vpc_id = "${aws_vpc.vpc_for_web_app.id}"
}

resource "aws_subnet" "app_subnet_a" {
  cidr_block = "${cidrsubnet(aws_vpc.vpc_for_web_app.cidr_block,2,3)}"
  vpc_id = "${aws_vpc.vpc_for_web_app.id}"
}

resource "aws_subnet" "app_subnet_b" {
  cidr_block = "${cidrsubnet(aws_vpc.vpc_for_web_app.cidr_block,2,4)}"
  vpc_id = "${aws_vpc.vpc_for_web_app.id}"
}