
# This Terraform configuration file creates a VPC and associated resources for different environments.

# Configuring the required provider for AWS.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.64.0"
    }
  }
}

# Resource: aws_vpc.prd-vpc
# Description: Creates a VPC for the production environment.
resource "aws_vpc" "prd-vpc" {
  cidr_block = "10.0.0.0/16"
}

# Resource: aws_vpc.dev-vpc
# Description: Creates a VPC for the development environment.

# Use Copilot to create a new module for the development VPC
resource "aws_vpc" "dev-vpc" {
  cidr_block = "10.10.0.0/16"
}

# Resource: aws_security_group.dev-web-sg
# Description: Creates a security group for the development web server.
resource "aws_security_group" "dev-web-sg" {
  vpc_id = aws_vpc.dev-vpc.id

  ingress {
    description = "allow inbound traffic from the internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
}

# Resource: aws_vpc.test-vpc
# Description: Creates a VPC for testing Copilot features.
resource "aws_vpc" "test-vpc" {
  cidr_block = "10.20.0.0/16"
}

# Resource: aws_subnet.prd-pub-subnet-1
# Description: Creates a public subnet in the production VPC.
resource "aws_subnet" "prd-pub-subnet-1" {
  vpc_id            = aws_vpc.prd-vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "prd-pub-subnet-1"
  }
}

# Resource: aws_subnet.prd-pub-subnet-2
# Description: Creates a public subnet in the production VPC.
resource "aws_subnet" "prd-pub-subnet-2" {
  vpc_id            = aws_vpc.prd-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "prd-pub-subnet-2"
  }
}

# Resource: aws_subnet.prd-pub-subnet-3
# Description: Creates a public subnet in the production VPC.
resource "aws_subnet" "prd-pub-subnet-3" {
  vpc_id            = aws_vpc.prd-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "prd-pub-subnet-3"
  }
}

# Resource: aws_subnet.prd-pri-subnet-1
# Description: Creates a private subnet in the production VPC.
resource "aws_subnet" "prd-pri-subnet-1" {
  vpc_id            = aws_vpc.prd-vpc.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "prd-pri-subnet-1"
  }
}

# Resource: aws_subnet.prd-pri-subnet-2
# Description: Creates a private subnet in the production VPC.
resource "aws_subnet" "prd-pri-subnet-2" {
  vpc_id            = aws_vpc.prd-vpc.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "prd-pri-subnet-2"
  }
}

# Resource: aws_subnet.prd-pri-subnet-3
# Description: Creates a private subnet in the production VPC.
resource "aws_subnet" "prd-pri-subnet-3" {
  vpc_id            = aws_vpc.prd-vpc.id
  cidr_block        = "10.0.12.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "prd-pri-subnet-3"
  }
}

# Resource: aws_internet_gateway.prd-igw
# Description: Creates an internet gateway for the production VPC.
resource "aws_internet_gateway" "prd-igw" {
  vpc_id = aws_vpc.prd-vpc.id

  tags = {
    Name = "prd-igw"
  }
}

# Resource: aws_route_table.prd-pub-rt
# Description: Creates a route table for the public subnets in the production VPC.
resource "aws_route_table" "prd-pub-rt" {
  vpc_id = aws_vpc.prd-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prd-igw.id
  }
}

# Resource: aws_route_table_association.prd-pub-rt-assoc-1
# Description: Associates the public subnet 1 with the public route table in the production VPC.
resource "aws_route_table_association" "prd-pub-rt-assoc-1" {
  subnet_id      = aws_subnet.prd-pub-subnet-1.id
  route_table_id = aws_route_table.prd-pub-rt.id
}

# Resource: aws_route_table_association.prd-pub-rt-assoc-2
# Description: Associates the public subnet 2 with the public route table in the production VPC.
resource "aws_route_table_association" "prd-pub-rt-assoc-2" {
  subnet_id      = aws_subnet.prd-pub-subnet-2.id
  route_table_id = aws_route_table.prd-pub-rt.id
}

# Resource: aws_route_table_association.prd-pub-rt-assoc-3
# Description: Associates the public subnet 3 with the public route table in the production VPC.
resource "aws_route_table_association" "prd-pub-rt-assoc-3" {
  subnet_id      = aws_subnet.prd-pub-subnet-3.id
  route_table_id = aws_route_table.prd-pub-rt.id
}

# Resource: aws_route_table.prd-pri-rt
# Description: Creates a route table for the private subnets in the production VPC.
resource "aws_route_table" "prd-pri-rt" {
  vpc_id = aws_vpc.prd-vpc.id
}

# Resource: aws_route_table_association.prd-pri-rt-assoc-1
# Description: Associates the private subnet 1 with the private route table in the production VPC.
resource "aws_route_table_association" "prd-pri-rt-assoc-1" {
  subnet_id      = aws_subnet.prd-pri-subnet-1.id
  route_table_id = aws_route_table.prd-pri-rt.id
}

# Resource: aws_route_table_association.prd-pri-rt-assoc-2
# Description: Associates the private subnet 2 with the private route table in the production VPC.
resource "aws_route_table_association" "prd-pri-rt-assoc-2" {
  subnet_id      = aws_subnet.prd-pri-subnet-2.id
  route_table_id = aws_route_table.prd-pri-rt.id
}

# Resource: aws_route_table_association.prd-pri-rt-assoc-3
# Description: Associates the private subnet 3 with the private route table in the production VPC.
resource "aws_route_table_association" "prd-pri-rt-assoc-3" {
  subnet_id      = aws_subnet.prd-pri-subnet-3.id
  route_table_id = aws_route_table.prd-pri-rt.id
}
