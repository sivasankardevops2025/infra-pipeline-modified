variable "env" {
    type = string
    description = "environment"
}

variable "vpc_cidr_block" {
    type = string
    description = "VPC cidr"

}

variable "subnet_cidr" {
    type = string
    description = "subnet cidr"

}

variable "subnet_availability_zone" {
    type = string
    description = "AZ of the subnet"

}
