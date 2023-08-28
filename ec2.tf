resource "aws_instance" "ec2-public" {
  count = 2
  ami                    = "ami-0aa7d40eeae50c9a9"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.web-key-pair.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  user_data              = file("./user-data.yaml")
  subnet_id = element(aws_subnet.public_subnet[*].id, count.index)

  # provisioner "remote-exec" {
  #   inline = [
  #       "sudo yum install httpd -y",
  #     "sudo systemctl start httpd",
  #   "sudo systemctl enable httpd"
  #   ]
  #   on_failure = fail
  # }

  tags = {
    "Name"  = "Khushi Carpenter Public"
    "Owner" = "khushi.carpenter@intuitive.cloud"
  }

}

resource "aws_instance" "ec2-private" {
  count = 2
  ami                    = "ami-0aa7d40eeae50c9a9"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.db-key-pair.key_name
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  subnet_id = element(aws_subnet.private_subnet[*].id, count.index)
  user_data              = file("./db-user-data.yaml")

  tags = {
    "Name"  = "Khushi Carpenter Private Subnet"
    "Owner" = "khushi.carpenter@intuitive.cloud"
  }

}