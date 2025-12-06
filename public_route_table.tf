# ----------------------------------------------------------
# Public Route Table for WordPress VPC
# ----------------------------------------------------------

# Create the public route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.wordpress_vpc.id

  tags = {
    Name = "public_rt"
  }
}

# Add route to the Internet through the IGW
resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.wordpress_igw.id
}

# Associate the public subnet with the public route table
resource "aws_route_table_association" "public_subnet_1_assoc" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}