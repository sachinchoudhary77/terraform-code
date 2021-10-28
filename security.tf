resource "aws_security_group" "bastion" {
  name        = "bastion-sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.demo-vpc.id

  ingress  {
      description      = "All SSH from Laptop"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["122.177.67.7/32"] 
    }

  egress   {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]  
    }
  
  tags = {
    Name = "bastion-sg"
    Environment = "stage"
  }
}
resource "aws_security_group" "lb" {
  name        = "lb-sg"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.demo-vpc.id

  ingress  {
      description      = "Allow HTTP inbound traffic"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"] 
    }

  egress   {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]  
    }
  
  tags = {
    Name = "lb-sg"
    Environment = "stage"
  }
}
resource "aws_security_group" "app" {
  name        = "app-sg"
  description = "Allow HTTP and SSH inbound traffic"
  vpc_id      = aws_vpc.demo-vpc.id

  ingress  {
      description      = "Allow HTTP inbound traffic"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      security_groups  = [aws_security_group.lb.id] 
    }
  ingress  {
      description      = "Allow Bastion SSH inbound traffic"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      security_groups  = [aws_security_group.bastion.id] 
    }

  egress   {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]  
    }
  
  tags = {
    Name = "app-sg"
    Environment = "stage"
  }
}
