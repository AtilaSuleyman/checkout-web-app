resource "aws_dynamodb_table" "terraform-state-locks" {
  name = "${var.tf-locks-db-name}"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}