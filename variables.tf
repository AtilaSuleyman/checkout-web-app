variable "tf-state-bucket-name" {
  type = "string"
  description = "name for terraform bucket that holds state information"
}

variable "tf-locks-db-name" {
  type = "string"
  description = "name for dynamodb that will hold terraform locks"
}