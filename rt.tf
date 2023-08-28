resource "aws_route_table" "public-rt" {
  vpc_id = var.vpc_id

  route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    //RT uses this IGW to reach internet
    gateway_id = var.igw_id
  }

  tags = {
    Name = "khushi-carpenter-public-rt"
  }
}

resource "aws_route_table" "private-rt" {
  vpc_id = var.vpc_id

route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    //RT uses this Nat gateway to reach internet
    nat_gateway_id = var.nat_id
  }

  tags = {
    Name = "khushi-carpenter-private-rt"
  }
}

resource "aws_route_table_association" "public-subnet-ass" {
  count = 2
  subnet_id      = element(aws_subnet.public_subnet[*].id, count.index)
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "private-subnet-ass" {
  count = 2
  subnet_id      = element(aws_subnet.private_subnet[*].id, count.index)
  route_table_id = aws_route_table.private-rt.id
}
