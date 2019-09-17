terraform {
  backend "s3" {
    region = "eu-west-2"
    encrypt = true
    bucket = "${var.tf-state-bucket-name}"
    key = "terraform.tfstate"
    dynamodb_table = "${var.tf-locks-db-name}"
  }
}