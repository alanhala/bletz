

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
    value = "37faa6e3efae09617401cd46cdc71a2fa3b2fd3768ae822d542963fcf41ea2ec13ad2ed0a1572507ee5c2b8aa1e36acd3cc99b4b17bad8397a5a1ee36f9e6ea2"
  }
}
