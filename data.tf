data "aws_iam_policy_document" "terraform-state-bucket-policy" {
  statement {
    effect = "Allow"

    actions = [
      "s3:s3:ListBucket",
    ]

    resources = [
      "${aws_s3_bucket.terraform-state-storage-s3.arn}",
    ]
  }

  statement {

    effect = "Allow"

    actions = [
      "s3:GetObject", "s3:PutObject",
    ]

    resources = [
      "${aws_s3_bucket.terraform-state-storage-s3.arn}/*",
    ]
  }
}