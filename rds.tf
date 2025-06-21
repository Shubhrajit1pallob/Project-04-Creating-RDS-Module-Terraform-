module "database" {
  source       = "./modules/rds"
  project_name = "project-04-rds-module"
  security_group_ids = [
    aws_security_group.Compliant.id
    # aws_security_group.NonCompliant.id
  ]
  subnet_ids = [
    aws_subnet.private1.id,
    aws_subnet.private2.id
  ]

  credentials = {
    username = "dbadmin"
    password = "12-34_ab?"
  }
}