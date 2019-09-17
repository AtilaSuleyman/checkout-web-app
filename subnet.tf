resource "aws_subnet" "dmz_subnet_a" {
  cidr_block = "${cidrsubnet(aws_vpc.vpc_for_web_app.cidr_block,4,0)}"
  vpc_id = "${aws_vpc.vpc_for_web_app.id}"
  tags {
    Name = "dmz_subnet_b"
  }
}

resource "aws_subnet" "dmz_subnet_b" {
  cidr_block = "${cidrsubnet(aws_vpc.vpc_for_web_app.cidr_block,4,1)}"
  vpc_id = "${aws_vpc.vpc_for_web_app.id}"
  tags {
    Name = "dmz_subnet_b"
  }
}

resource "aws_subnet" "app_subnet_a" {
  cidr_block = "${cidrsubnet(aws_vpc.vpc_for_web_app.cidr_block,4,3)}"
  vpc_id = "${aws_vpc.vpc_for_web_app.id}"
  tags {
    Name = "app_subnet_a"
  }
}

resource "aws_subnet" "app_subnet_b" {
  cidr_block = "${cidrsubnet(aws_vpc.vpc_for_web_app.cidr_block,4,4)}"
  vpc_id = "${aws_vpc.vpc_for_web_app.id}"
  tags {
    Name = "app_subnet_b"
  }
}