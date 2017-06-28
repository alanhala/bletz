variable "bucket_name" {}
variable "acl" {}



resource "aws_s3_bucket" "test_ycpm_com" {
    bucket = "${var.bucket_name}"
    acl = "${var.acl}"

  
}
variable "bucket_name" {}
variable "acl" {}



resource "aws_s3_bucket" "test_ycpm_com" {
    bucket = "${var.bucket_name}"
    acl = "${var.acl}"

  
}
