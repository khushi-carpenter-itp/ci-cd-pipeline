resource "aws_subnet" "public_subnet" {
  count = 2
  #   for_each=toset(var.subnet_cidr_public)
  #   cidr_block=each.key
  cidr_block = element(var.subnet_cidr_public, count.index)
  vpc_id     = var.vpc_id
  availability_zone       = element(var.az, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "khushi-carpenter-public-${count.index+1}"
  }
}

resource "aws_subnet" "private_subnet" {
  count = 2

  cidr_block = element(var.subnet_cidr_private, count.index)
  vpc_id     = var.vpc_id
  availability_zone       = element(var.az, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "khushi-carpenter-private-${count.index+1}"
  }
}

# resource "aws_subnet" "public-subnet" {
#   vpc_id                  = var.vpc_id
#   cidr_block              = "10.0.16.64/26"
#   availability_zone       = "us-east-1a"
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "khushi-carpenter-public-1"
#   }
# }

# resource "aws_subnet" "public-subnet-2" {
#   vpc_id                  = var.vpc_id
#   cidr_block              = "10.0.16.64/26"
#   availability_zone       = "us-east-1b"
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "khushi-carpenter-public-2"
#   }
# }

# resource "aws_subnet" "private-subnet-1" {
#   vpc_id            = var.vpc_id
#   cidr_block        = "10.0.16.128/26"
#   availability_zone = "us-east-1a"
#   tags = {
#     Name = "khushi-carpenter-private-1"
#   }
# }

# resource "aws_subnet" "private-subnet-2" {
#   vpc_id            = var.vpc_id
#   cidr_block        = "10.0.16.192/26"
#   availability_zone = "us-east-1b"
#   tags = {
#     Name = "khushi-carpenter-private-2"
#   }
# }
