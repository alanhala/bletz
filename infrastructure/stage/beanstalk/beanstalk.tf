

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
    value = "24d58e5234ebbb834962e7fbbdcd99c3031c615bbd199f77bd78db81371b3c0a246ebf43b48cc5d1e8d36bba858a2548fd871b4ff3faa1c8a36c6eafbac679a7"
  }
}
