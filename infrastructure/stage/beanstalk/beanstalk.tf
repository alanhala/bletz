

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
    value = "c6d1edc01c58f5a042d510da57766757f734151c6decd640ed6f72279b1d662dbfc824da9fe10433794aeb34919d6c2652a39d70055b78a8ec06d725a0f056a7"
  }
}


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
    value = "847dd2ba8e36e8c90bbd58b95d4d937d1cb3e19f6eb6f8dde15b8c63ad579f0caaf2f0df02c454e200f3becfab42a22c5813596cc0ce404efeaae64ce9622013"
  }
}
