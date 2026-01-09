module "VPC" {
  source                = "../../Modules/VPC"
  vpc_cidr_block        = "10.0.0.0/16"
  subnet_cidr           =  "10.0.1.0/24"
  subnet_availability_zone =   "${var.aws_region}a"  
  env                   = "dev"
  
}

module "ec2" {
  source        = "../../Modules/ec2"
  ami_id        = "ami-01dc51e87421923b6" 
  instance_type = "t3.micro"
  subnet_id     =   module.VPC.subnet_id
  ec2_count     = 0
   env          = "dev"
}