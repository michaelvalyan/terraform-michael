

# VPC

resource "aws_vpc" "tf_vpc" {
  cidr_block                = var.vpc_cidr
  
  tags = {
    Name                    = var.vpc_name
  }
}


# Internet Gateway

resource "aws_internet_gateway" "tf_igw" {
  vpc_id                    = aws_vpc.tf_vpc.id
  tags = {
    Name                    = "tf_igw"
  }
}

# Route Table

resource "aws_route_table" "tf_rt" {
  vpc_id                    = aws_vpc.tf_vpc.id
  tags = {
    Name                    = "tf_rt"
  }
}


# Route to Internet Gateway

resource "aws_route" "td_igw" {
  route_table_id            = aws_route_table.tf_rt.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.tf_igw.id
}


# Subnets

resource "aws_subnet" "public_subnet_1" {
  vpc_id                    = aws_vpc.tf_vpc.id
  cidr_block                = var.subnet_one_cidr
  availability_zone         = "us-east-1a"
  map_public_ip_on_launch   = true
  
  tags = {
    Name                    = var.subnet_one_name
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                    = aws_vpc.tf_vpc.id
  cidr_block                = var.subnet_two_cidr
  availability_zone         = "us-east-1b"
  map_public_ip_on_launch   = true
  
  tags = {
    Name                    = var.subnet_two_name
  }
}


# Subnets Route Table Associations

resource "aws_route_table_association" "public_subnet_association_1" {
  subnet_id                 = aws_subnet.public_subnet_1.id
  route_table_id            = aws_route_table.tf_rt.id
}

resource "aws_route_table_association" "public_subnet_association_2" {
  subnet_id                 = aws_subnet.public_subnet_2.id
  route_table_id            = aws_route_table.tf_rt.id
}


# Security Groups

resource "aws_security_group" "bastion_sg" {
  name                      = "bastion_sg"
  description               = "Security group for Bastion Host EC2 instance"
  vpc_id                    = aws_vpc.tf_vpc.id

# SSH
  ingress {
    from_port               = 22
    to_port                 = 22
    protocol                = "tcp"
    cidr_blocks             = ["0.0.0.0/0"]
  }

# Egress rule for all outbound traffic
  egress {
    from_port               = 0
    to_port                 = 0
    protocol                = "-1"
    cidr_blocks             = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "web_sg" {
  name                      = "web_sg"
  description               = "Security group for Web Server EC2 instance"
  vpc_id                    = aws_vpc.tf_vpc.id

# SSH
  ingress {
    from_port               = 22
    to_port                 = 22
    protocol                = "tcp"
    cidr_blocks             = [var.vpc_cidr]
  }

# http
  ingress {
    from_port               = 80
    to_port                 = 80
    protocol                = "tcp"
    cidr_blocks             = ["0.0.0.0/0"]
  }

# Egress rule for all outbound traffic
  egress {
    from_port               = 0
    to_port                 = 0
    protocol                = "-1"
    cidr_blocks             = ["0.0.0.0/0"]
  }
}
