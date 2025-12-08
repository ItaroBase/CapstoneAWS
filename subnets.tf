


# Create Public Subnet 1 in the VPC
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.wordpress_vpc.id
  cidr_block              = "10.0.0.0/28"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "PublicSubnet1"
  }
}