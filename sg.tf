resource "aws_security_group" "web_sg" {
  name        = "khushi-carpenter-web-sg"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allowing HTTPS port for ec2-web"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allowing HTTP port for ec2-web"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "khushi-carpenter-web-sg"
  }
}

resource "aws_security_group" "db_sg" {
  name        = "khushi-carpenter-db-sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = ["${aws_security_group.web_sg.id}"]
  }

  tags = {
    Name = "khushi-carpenter-db-sg"
  }
}