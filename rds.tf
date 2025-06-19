module "database" {
  source             = "./modules/rds"
  project_name       = "Project-04-rds-module"
  security_group_ids = []
  subnet_ids = [
    aws_subnet.private1.id
  ]

  credentials = {
    username = "db.admin"
    password = "12-34_ab?"
  }
}