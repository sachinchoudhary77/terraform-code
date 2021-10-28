resource "aws_vpc" "demo-vpc" {
  cidr_block       = "10.0.0.0/24"
  instance_tenancy = "default"

  tags = {
    Name = "demo-vpc"
    Environment = "stage"
  }
}
