resource "aws_instance" "wordpress_server" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2023 in us-west-2
  instance_type = "t2.micro"

  subnet_id                   = aws_subnet.public_subnet_1.id
  vpc_security_group_ids      = [aws_security_group.wordpress_sg.id]
  associate_public_ip_address = true

  user_data = file("user_data.sh")

  tags = {
    Name = "WordPress-Server"
  }
}
