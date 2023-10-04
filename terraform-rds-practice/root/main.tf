

provider "aws" {
  region = "us-east-1"
}


module "rds" {
  source = "../modules/rds"

  db_name         = var.rds_db_name
  engine_type     = var.rds_engine_type
  db_username     = var.rds_db_username       
  db_password     = var.rds_db_password
  db_server_class = var.rds_db_server_class
  db_storage      = var.rds_db_storage
}