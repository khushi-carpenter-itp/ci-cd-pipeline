resource "aws_key_pair" "web-key-pair" {
  key_name   = "khushi-carpenter-web-key"
  public_key = tls_private_key.rsa.public_key_openssh
}
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "web-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "khushi-carpenter-web-key.pem"
}

resource "aws_key_pair" "db-key-pair" {
  key_name   = "khushi-carpenter-db-key"
  public_key = tls_private_key.rsa1.public_key_openssh
}
resource "tls_private_key" "rsa1" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "db-key" {
  content  = tls_private_key.rsa1.private_key_pem
  filename = "khushi-carpenter-db-key.pem"
}