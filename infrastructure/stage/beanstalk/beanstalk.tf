

variable "environment" {}
variable "application_name" {}
variable "instance_type" {}

variable "db_user" {}
variable "db_name" {}
variable "db_url" {}



resource "random_id" "ycpm_stage_db_passwd" {
  byte_length = 4
}

resource "aws_elastic_beanstalk_environment" "ycpm-stage" {
  name = "${var.application_name}-${var.environment}"
  application = "ycpm"
  solution_stack_name = "64bit Amazon Linux 2017.03 v2.4.0 running Ruby 2.3 (Puma)"
  cname_prefix = "${var.application_name}-${var.environment}"
  

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = "${aws_security_group.ycpm-stage.name}"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "InstanceType"
    value = "${var.instance_type}"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "${aws_iam_instance_profile.ycpm-stage.arn}"
  }


  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "DATABASE_URL"
    value = "postgres://${var.db_user}:${random_id.ycpm_stage_db_passwd.hex}@${var.db_url}:5432/${var.db_name}"
  }


  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "SECRET_KEY_BASE"
    value = "177bb850de966b5845afc1d861d694fae7fd1ae2253673d0b5556e6687c0adada8cc9455f3c33e6fa7b59d2ef5b94bdf2e5c97950108c7996ba52ff14f9b1578"
  }
}
