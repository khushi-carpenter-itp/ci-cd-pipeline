variable "ami" {
  type = string
  default = "ami-0aa7d40eeae50c9a9"
}

variable "vpc_id" {
  type = string
  default = "vpc-0dba6c5993932c285"
}

variable "igw_id" {
  type =string
  default = "igw-0d1d491f2bf37adec"
}

variable "nat_id" {
  type=string
  default = "nat-0457211d6f24ab564"
}

variable "subnet_cidr_public" {
    type = list(string)
    default = ["10.0.16.0/26","10.0.16.64/26"]
}

variable "subnet_cidr_private" {
    type = list(string)
  default = ["10.0.16.128/26","10.0.16.192/26"]
}

variable "az" {
  type = list(string)
  default = [ "us-east-1a","us-east-1b" ]
}