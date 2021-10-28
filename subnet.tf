resource "aws_subnet" "sub1" {
  vpc_id     = aws_vpc.demo-vpc.id
  cidr_block = var.sub1_cidr
  map_public_ip_on_launch = "true"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "pub-sub-1"
    Environment = "stage"
  }
}
resource "aws_subnet" "sub2" {
  vpc_id     = aws_vpc.demo-vpc.id
  cidr_block = var.sub2_cidr
  map_public_ip_on_launch = "true"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "pub-sub-2"
    Environment = "stage"
  }
}
resource "aws_subnet" "sub3" {
  vpc_id     = aws_vpc.demo-vpc.id
  cidr_block = var.sub3_cidr
  availability_zone = "ap-south-1a"

  tags = {
    Name = "pri-sub-1"
    Environment = "stage"
  }
}
resource "aws_subnet" "sub4" {
  vpc_id     = aws_vpc.demo-vpc.id
  cidr_block = var.sub4_cidr
  availability_zone = "ap-south-1b"

  tags = {
    Name = "pri-sub-2"
    Environment = "stage"
  }
}
