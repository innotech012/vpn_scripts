resource "aws_vpc" "sbu_vpn_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "sbu_vpn_vpc"
  }
}


resource "aws_subnet" "sbu_vpn_subnet" {
  vpc_id = aws_vpc.sbu_vpn_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "sbu_vpn_subnet"
  }
}


resource "aws_internet_gateway" "sbu_vpn_igw" {
  vpc_id = aws_vpc.sbu_vpn_vpc.id
  tags = {
    Name = "sbu_vpn_igw"
  }
}

resource "aws_route_table" "sbu_vpn_rt" {
  vpc_id = aws_vpc.sbu_vpn_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sbu_vpn_igw.id
  }
    tags = {
        Name = "sbu_vpn_rt"
    }
}

resource "aws_route_table_association" "sbu_vpn_rta" {
  subnet_id = aws_subnet.sbu_vpn_subnet.id
  route_table_id = aws_route_table.sbu_vpn_rt.id
}