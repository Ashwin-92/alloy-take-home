terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "Terraform_iam_user"
  region  = "us-east-1"
    access_key="AKIAZAR64TJOIFAXV22F"
    secret_key="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"
}

resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr

  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name = "Ash-VPC"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name =  "Ash-IGW"
  }
}

resource "aws_route" "route-public" {
  route_table_id         = aws_vpc.main.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_cidr
  availability_zone = var.public_az

  tags = {
    Name = "Ash-net-public"
  }
}

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private1_cidr
  availability_zone = var.private1_az

  tags = {
    Name = "Ash-net-private1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private2_cidr
  availability_zone = var.private2_az

  tags = {
    Name = "Ash-net-private2"
  }
}

resource "aws_eip" "gw" {
  vpc        = true
  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name =  "Ash-EIP"
  }
}

resource "aws_nat_gateway" "gw" {
  subnet_id     = aws_subnet.public.id
  allocation_id = aws_eip.gw.id

  tags = {
    Name =  "Ash-NAT"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw.id
  }

  tags = {
    Name =  "Ash-rt-private"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_vpc.main.main_route_table_id
}

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private.id
}
