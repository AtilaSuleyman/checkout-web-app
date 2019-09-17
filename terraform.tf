terraform {
  backend "s3" {
    region = "eu-west-2"
    encrypt = true
    bucket = "${aws_s3_bucket.terraform-state-storage-s3.bucket}"
    key = "/"
  }
}