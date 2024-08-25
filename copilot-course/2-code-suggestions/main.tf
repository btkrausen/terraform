terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.64.0"
    }
  }
}

resource "aws_vpc" "prd-vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "prd-pub-subnet-1" {
  vpc_id            = aws_vpc.prd-vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "prd-pub-subnet-1"
  }
}

resource "aws_subnet" "prd-pub-subnet-2" {
  vpc_id            = aws_vpc.prd-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "prd-pub-subnet-2"
  }
}

resource "aws_subnet" "prd-pub-subnet-3" {
  vpc_id            = aws_vpc.prd-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "prd-pub-subnet-3"
  }
}

resource "aws_subnet" "prd-pri-subnet-1" {
  vpc_id            = aws_vpc.prd-vpc.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "prd-pri-subnet-1"
  }
}

resource "aws_subnet" "prd-pri-subnet-2" {
  vpc_id            = aws_vpc.prd-vpc.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "prd-pri-subnet-2"
  }
}

resource "aws_subnet" "prd-pri-subnet-3" {
  vpc_id            = aws_vpc.prd-vpc.id
  cidr_block        = "10.0.12.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "prd-pri-subnet-3"
  }
}

resource "aws_internet_gateway" "prd-igw" {
  vpc_id = aws_vpc.prd-vpc.id

  tags = {
    Name = "prd-igw"
  }
}

resource "aws_route_table" "prd-pub-rt" {
  vpc_id = aws_vpc.prd-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prd-igw.id
  }
}

resource "aws_route_table_association" "prd-pub-rt-assoc-1" {
  subnet_id      = aws_subnet.prd-pub-subnet-1.id
  route_table_id = aws_route_table.prd-pub-rt.id
}

resource "aws_route_table_association" "prd-pub-rt-assoc-2" {
  subnet_id      = aws_subnet.prd-pub-subnet-2.id
  route_table_id = aws_route_table.prd-pub-rt.id
}

resource "aws_route_table_association" "prd-pub-rt-assoc-3" {
  subnet_id      = aws_subnet.prd-pub-subnet-3.id
  route_table_id = aws_route_table.prd-pub-rt.id
}

resource "aws_route_table" "prd-pri-rt" {
  vpc_id = aws_vpc.prd-vpc.id
}

resource "aws_route_table_association" "prd-pri-rt-assoc-1" {
  subnet_id      = aws_subnet.prd-pri-subnet-1.id
  route_table_id = aws_route_table.prd-pri-rt.id
}

resource "aws_route_table_association" "prd-pri-rt-assoc-2" {
  subnet_id      = aws_subnet.prd-pri-subnet-2.id
  route_table_id = aws_route_table.prd-pri-rt.id
}

resource "aws_route_table_association" "prd-pri-rt-assoc-3" {
  subnet_id      = aws_subnet.prd-pri-subnet-3.id
  route_table_id = aws_route_table.prd-pri-rt.id
}