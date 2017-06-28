variable "test_ycpm_com_bucket_name" {
  default     = "test.ycpm.com"
  description = "Bucket name"
}

module "s3_test_ycpm_com" {
  source = "./s3/stage/test.ycpm.com"
  bucket_name = "${var.test_ycpm_com_bucket_name}"
  acl = "private"
}
variable "test_ycpm_com_bucket_name" {
  default     = "test.ycpm.com"
  description = "Bucket name"
}

module "s3_test_ycpm_com" {
  source = "./s3/stage/test.ycpm.com"
  bucket_name = "${var.test_ycpm_com_bucket_name}"
  acl = "private"
}
