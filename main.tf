# defining a custom vpc
resource "aws_vpc" "terra_vpc" {
  enable_dns_hostnames = true
  enable_dns_support   = true
  cidr_block           = var.terra_vpc_cidr_block

  tags = {
    Name = "terra_vcp"
  }
}

resource "aws_internet_gateway" "terra-igw" {
  vpc_id = aws_vpc.terra_vpc.id
  tags = {
    Name = "terra-igw"
  }
}


# defining public route table
resource "aws_route_table" "pub-route-table" {
  vpc_id = aws_vpc.terra_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terra-igw.id
  }

  tags = {
    Name = "pub_route_table"
  }
}

# defining private route table
resource "aws_route_table" "priv-route-table" {
  vpc_id = aws_vpc.terra_vpc.id

  tags = {
    Name = "priv_route_table"
  }
}

# create public subnet 1
resource "aws_subnet" "terra_pub_sub1" {
  vpc_id                = aws_vpc.terra_vpc.id
  cidr_block            = var.pub_sub1_cidr_block
  availability_zone = var.aws_availability_zone
  tags = {
    Name = "terra_pub_subnet"
  }
}

# create private subnet 1
resource "aws_subnet" "terra_priv_sub1" {
  vpc_id                = aws_vpc.terra_vpc.id
  cidr_block            = var.priv_sub1_cidr_block
  availability_zone = var.aws_availability_zone
  tags = {
    Name = "terra_priv_subnet"
  }
}

# association of public subnet1 with Public Route Table
resource "aws_route_table_association" "pub_association" {
  subnet_id      = aws_subnet.terra_pub_sub1.id
  route_table_id = aws_route_table.pub-route-table.id
}

# association of priate subnet1 with Private Route Table
resource "aws_route_table_association" "prv_association" {
  subnet_id      = aws_subnet.terra_priv_sub1.id
  route_table_id = aws_route_table.priv-route-table.id
}

# defining web security group
resource "aws_security_group" "terra_web_sg" {
  name        = "terra_web_sg"
  description = "Allow web inbound traffic"
  vpc_id      = aws_vpc.terra_vpc.id

  ingress {
    description = "http traffic to terra-web"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ssh traffic to terra-web"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["98.204.239.115/32"] # replace this ip to a specific group that has access
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_web_ssh_traffic"
  }
}
