resource "aws_internet_gateway" "wp_internet_gateway" {
  vpc_id = aws_vpc.wordpress_vpc.id

  tags = {
    Name = "wp_internet_gateway"
  }
}