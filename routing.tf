resource "aws_internet_gateway" "basic-web-app-gateway" {
  vpc_id = "${aws_vpc.vpc_for_web_app.id}"

  tags = {
    Name = "basic-web-app-gateway"
  }
}

resource "aws_route_table" "basic-web-app-route-table" {
  vpc_id = "${aws_vpc.vpc_for_web_app.id}"

  route {
    cidr_block = "0.0.0.0/32"
    gateway_id = "${aws_internet_gateway.basic-web-app-gateway.id}"
  }

  tags = {
    Name = "basic-web-app-route-table"
  }
}

