resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.demo-vpc.id

  tags = {
    Name = "demo-igw"
    Environment = "stage"
  }
}
resource "aws_eip" "eip" {
  vpc      = true
}
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.sub1.id

  tags = {
    Name = "gw NAT"
    Environment = "stage"
  }
  depends_on = [aws_internet_gateway.gw]
}
resource "aws_route_table" "r1" {
  vpc_id = aws_vpc.demo-vpc.id

  route    {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.gw.id
    }
  
  tags = {
    Name = "public-route"
    Environment = "stage"
  }
}
resource "aws_route_table" "r2" {
  vpc_id = aws_vpc.demo-vpc.id

  route     {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.nat.id
    }
  
  tags = {
    Name = "private-route"
    Environment = "stage"
  }
}
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.sub1.id
  route_table_id = aws_route_table.r1.id
}
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.sub2.id
  route_table_id = aws_route_table.r1.id
}
resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.sub3.id
  route_table_id = aws_route_table.r2.id
}
resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.sub4.id
  route_table_id = aws_route_table.r2.id
}
