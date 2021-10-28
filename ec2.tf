resource "aws_instance" "bastion" {
  ami           = "ami-041d6256ed0f2061c"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.sub1.id
  vpc_security_group_ids = [aws_security_group.bastion.id]
  key_name = aws_key_pair.demo.key_name

  tags = {
    Name = "BASTION"
    Environment = "stage"
  }
}
resource "aws_instance" "app1" {
  ami           = "ami-041d6256ed0f2061c"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.sub3.id
  vpc_security_group_ids = [aws_security_group.app.id]
  key_name = aws_key_pair.demo.key_name
  user_data = file("app.sh")

  tags = {
    Name = "App1"
    Environment = "stage"
  }
}
resource "aws_instance" "app2" {
  ami           = "ami-0c1a7f89451184c8b"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.sub4.id
  vpc_security_group_ids = [aws_security_group.app.id]
  key_name = aws_key_pair.demo.key_name
  user_data = file("app.sh")

  tags = {
    Name = "App2"
    Environment = "stage"
  }
}
