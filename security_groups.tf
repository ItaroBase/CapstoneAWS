# Bastion Host security security group'

resource "aws_security_group" "aws_ssh_sg" {
  name        = "aws_ssh_sg"
  description = "Allow SSH from your IP to Bastion Host"
  vpc_id      = aws_vpc.wordpress_vpc.id

  ingress {
    description = "SSH from your IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["95.90.247.241/32"]  # <-- My IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "aws_ssh_sg"
  }
}

# WordPress security group
resource "aws_security_group" "wordpress_sg" {
  name        = "wordpress_sg"
  description = "Allow HTTP and SSH"
  vpc_id      = aws_vpc.wordpress_vpc.id

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH ONLY from Bastion Host"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.aws_ssh_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "wordpress_sg"
  }
}