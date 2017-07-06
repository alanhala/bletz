variable "environment" {}
variable "application_name" {}
variable "engine" {}
variable "engine_version" {}
variable "storage" {}
variable "instance_class" {}


resource "random_id" "ycpm_stage_db_passwd" {
  byte_length = 4
}

resource "aws_db_instance" "ycpm-stage" {
  identifier             = "${var.application_name}-${var.environment}"
  allocated_storage      = "${var.storage}"
  engine                 = "${var.engine}"
  engine_version         = "${var.engine_version}"
  instance_class         = "${var.instance_class}"
  name                   = "${replace("${var.application_name}", "-", "_")}"
  username               = "${replace("${var.application_name}", "-", "_")}"
  password               = "${random_id.ycpm_stage_db_passwd.hex}"
  skip_final_snapshot    = true
  vpc_security_group_ids = ["${aws_security_group.ycpm-stage.id}"]
  
}


variable "environment" {}
variable "application_name" {}
variable "engine" {}
variable "engine_version" {}
variable "storage" {}
variable "instance_class" {}


resource "random_id" "ycpm_stage_db_passwd" {
  byte_length = 4
}

resource "aws_db_instance" "ycpm-stage" {
  identifier             = "${var.application_name}-${var.environment}"
  allocated_storage      = "${var.storage}"
  engine                 = "${var.engine}"
  engine_version         = "${var.engine_version}"
  instance_class         = "${var.instance_class}"
  name                   = "${replace("${var.application_name}", "-", "_")}"
  username               = "${replace("${var.application_name}", "-", "_")}"
  password               = "${random_id.ycpm_stage_db_passwd.hex}"
  skip_final_snapshot    = true
  vpc_security_group_ids = ["${aws_security_group.ycpm-stage.id}"]
  
}


