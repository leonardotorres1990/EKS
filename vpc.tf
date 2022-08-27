resource "aws_vpc" "eks_vpc" {
  cidr_block           = var.eks_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "${var.project}_vpc"
  }
}

resource "aws_route_table" "rt_eks_vpc" {
  vpc_id = aws_vpc.eks_vpc.id
  //Apply the following route after get a igw deployed 
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "rt_${var.project}_vpc"
  }
}

resource "aws_main_route_table_association" "rt_eks_vpc" {
  vpc_id         = aws_vpc.eks_vpc.id
  route_table_id = aws_route_table.rt_eks_vpc.id
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    Name = "igw_${var.project}_vpc"
  }
}

resource "aws_subnet" "eks_subnet_1" {
  vpc_id                  = aws_vpc.eks_vpc.id
  availability_zone       = "us-east-1a"
  cidr_block              = var.subnet_1
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet_1_${var.project}_vpc"
  }
}

resource "aws_subnet" "eks_subnet_2" {
  vpc_id                  = aws_vpc.eks_vpc.id
  availability_zone       = "us-east-1b"
  cidr_block              = var.subnet_2
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet_2_${var.project}_vpc"
  }
}

resource "aws_subnet" "pub_eks_subnet_1" {
  vpc_id                  = aws_vpc.eks_vpc.id
  availability_zone       = "us-east-1a"
  cidr_block              = var.pub_subnet_1
  map_public_ip_on_launch = true

  tags = {
    Name = "pub_subnet_1_${var.project}_vpc"
  }
}

resource "aws_subnet" "pub_eks_subnet_2" {
  vpc_id                  = aws_vpc.eks_vpc.id
  availability_zone       = "us-east-1b"
  cidr_block              = var.pub_subnet_2
  map_public_ip_on_launch = true

  tags = {
    Name = "pub_subnet_2_${var.project}_vpc"
  }
}
//Apply this section after get the subnets deployed
data "aws_subnets" "eks_subnet_ids" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.eks_vpc.id]
  }
}
data "aws_subnet" "eks_subnet" {
  count = length(data.aws_subnets.eks_subnet_ids.ids)
  id    = tolist(data.aws_subnets.eks_subnet_ids.ids)[count.index]
}

