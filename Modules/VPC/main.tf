resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "${var.env}-vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.subnet_availability_zone 
  tags = {
    Name = "${var.env}-subnet"
  }
}

output subnet_id {

  value       =  aws_subnet.main.id
  description = "descritioin"
  
}