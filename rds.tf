module "database" {
  source       = "./modules/rds"
  project_name = "Project-04-rds-module"

  credentials = {
    username = "db.admin"
    password = "12-34_ab?"
  }
}