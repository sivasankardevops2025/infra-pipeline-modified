variable "ami_id" {
    type = string
    description = "AMi id of my ec2"
  
}

variable "instance_type" {
    type = string
    description = "instance type of my ec2"
}

variable "subnet_id" {
    type = string
    description = "subnet id of my ec2"
}

variable "ec2_count" {
    type = string
    description = "number of ec2"
}

variable "env" {
    type = string
    description = "environment"
}