resource "aws_instance" "bastion_host" {
  ami           = "ami-02b297871a94f4b42"
  instance_type = "t2.micro"

  subnet_id                   = aws_subnet.public_subnet_1.id
  vpc_security_group_ids      = [aws_security_group.aws_ssh_sg.id]
  associate_public_ip_address = true

  user_data = file("bastion-host-userdata.sh")

  tags = {
    Name = "Bastion-Host"
  }
}

resource "aws_instance" "wordpress_server" {
  ami           = "ami-02b297871a94f4b42" # Amazon Linux 2023 in us-west-2
  instance_type = "t2.micro"

  subnet_id                   = aws_subnet.public_subnet_1.id
  vpc_security_group_ids      = [aws_security_group.wordpress_sg.id]
  associate_public_ip_address = true

  user_data = file("user_data.sh")

  tags = {
    Name = "WordPress-Server"
  }
}
