resource "aws_s3_bucket" "terraform-state-storage-s3" {
  bucket = "basic-web-app-state-bucket"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_policy" "terraform-state-bucket-policy" {
  bucket = "${aws_s3_bucket.terraform-state-storage-s3.id}"
  policy = "${data.aws_iam_policy_document.terraform-state-bucket-policy.json}"
}