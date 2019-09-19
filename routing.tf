resource "aws_internet_gateway" "basic-web-app-gateway" {
  vpc_id = "${aws_vpc.vpc_for_web_app.id}"

  tags = {
    Name = "basic-web-app-gateway"
  }
}

resource "aws_route_table" "basic-web-dmz-route-table" {
  vpc_id = "${aws_vpc.vpc_for_web_app.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.basic-web-app-gateway.id}"
  }

  tags = {
    Name = "basic-web-dmz-route-table"
  }
}

resource "aws_route_table_association" "route_traffic_to_dmz_a" {
  subnet_id      = "${aws_subnet.dmz_subnet_a.id}"
  route_table_id = "${aws_route_table.basic-web-dmz-route-table.id}"
}

resource "aws_route_table_association" "route_traffic_to_dmz_b" {
  subnet_id      = "${aws_subnet.dmz_subnet_b.id}"
  route_table_id = "${aws_route_table.basic-web-dmz-route-table.id}"
}

resource "aws_eip" "nat_eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = "${aws_eip.nat_eip.id}"
  subnet_id = "${aws_subnet.dmz_subnet_a.id}"

  depends_on = ["aws_internet_gateway.basic-web-app-gateway"]
}

resource "aws_route_table" "basic-web-app-route-table" {
  vpc_id = "${aws_vpc.vpc_for_web_app.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.nat_gateway.id}"
  }

  tags = {
    Name = "basic-web-app-route-table"
  }
}

resource "aws_route_table_association" "route_traffic_from_app_a" {
  subnet_id      = "${aws_subnet.app_subnet_a.id}"
  route_table_id = "${aws_route_table.basic-web-app-route-table.id}"
}

resource "aws_route_table_association" "route_traffic_from_app_b" {
  subnet_id      = "${aws_subnet.app_subnet_b.id}"
  route_table_id = "${aws_route_table.basic-web-app-route-table.id}"
}


