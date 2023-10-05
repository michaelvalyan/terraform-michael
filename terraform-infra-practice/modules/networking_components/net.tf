

resource "aws_vpc" "infra_vpc" {
  cidr_block                = var.infra_vpc_sidr
}

resource "aws_subnet" "infra_public_subnet" {
  vpc_id                    = aws_vpc.infra_vpc.id
  cidr_block                = var.infra_subnet_cidr
  availability_zone         = var.infra_subnet_az
  map_public_ip_on_launch   = true
}

resource "aws_internet_gateway" "infra_igw" {
  vpc_id                    = aws_vpc.infra_vpc.id
}

resource "aws_route_table" "infra_rt" {
  vpc_id                    = aws_vpc.infra_vpc.id

  route {
    cidr_block              = "0.0.0.0/0"
    gateway_id              = aws_internet_gateway.infra_igw.id
  }
}

resource "aws_route_table_association" "infra_subnet_association" {
  subnet_id                 = aws_subnet.infra_public_subnet.id
  route_table_id            = aws_route_table.infra_rt.id
}
