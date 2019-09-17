resource "aws_s3_bucket" "terraform-state-storage-s3" {
  bucket = "${var.tf-state-bucket-name}"
  lifecycle {
    prevent_destroy = true
  }
}