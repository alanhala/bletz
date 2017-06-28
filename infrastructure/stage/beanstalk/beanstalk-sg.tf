resource "aws_security_group" "ycpm-stage" {
  name        = "beanstalk-${var.environment}-sg"
  description = "Beanstalk EC2 Security Group"
  
}
