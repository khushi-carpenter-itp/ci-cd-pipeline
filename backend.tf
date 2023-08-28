terraform {
  backend "s3" {
    bucket = "tf-training-backend-s3"
    key    = "Khushi-Carpenter/terraform.tfstate"
    region = "us-east-1"
  }
}
