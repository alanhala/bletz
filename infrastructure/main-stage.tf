variable "application_name" {
  default     = "ycpm"
  description = "Identifier for Beanstalk Application"
}



module "stage_api" {
  source = "./stage/beanstalk"
  application_name = "${var.application_name}"
  environment = "stage"
  instance_type = "t2.medium"
  
  db_user = "${module.stage_rds.db_user}"
  db_name = "${module.stage_rds.db_name}"
  db_url = "${module.stage_rds.db_url}"
  

  
}

module "stage_rds" {
  source = "./stage/rds"
  application_name = "${var.application_name}"
  environment = "stage"
  engine = "postgres"
  engine_version = "9.5.4"
  storage = "10"
  instance_class = "db.t2.micro"
  beanstalk_sg_id = "${module.stage_api.beanstalk_sg_id}"

  
}

variable "application_name" {
  default     = "ycpm"
  description = "Identifier for Beanstalk Application"
}



module "stage_api" {
  source = "./stage/beanstalk"
  application_name = "${var.application_name}"
  environment = "stage"
  instance_type = "t2.medium"
  
  db_user = "${module.stage_rds.db_user}"
  db_name = "${module.stage_rds.db_name}"
  db_url = "${module.stage_rds.db_url}"
  

  
}

module "stage_rds" {
  source = "./stage/rds"
  application_name = "${var.application_name}"
  environment = "stage"
  engine = "postgres"
  engine_version = "9.5.4"
  storage = "10"
  instance_class = "db.t2.micro"
  beanstalk_sg_id = "${module.stage_api.beanstalk_sg_id}"

  
}

variable "application_name" {
  default     = "ycpm"
  description = "Identifier for Beanstalk Application"
}



module "stage_api" {
  source = "./stage/beanstalk"
  application_name = "${var.application_name}"
  environment = "stage"
  instance_type = "t2.medium"
  
  db_user = "${module.stage_rds.db_user}"
  db_name = "${module.stage_rds.db_name}"
  db_url = "${module.stage_rds.db_url}"
  

  
}

module "stage_rds" {
  source = "./stage/rds"
  application_name = "${var.application_name}"
  environment = "stage"
  engine = "postgres"
  engine_version = "9.5.4"
  storage = "10"
  instance_class = "db.t2.micro"
  beanstalk_sg_id = "${module.stage_api.beanstalk_sg_id}"

  
}

