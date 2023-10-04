
resource "aws_db_instance" "db_server" {
  db_name               = var.db_name
  engine                = var.engine_type
  username              = var.db_username
  password              = var.db_password
  instance_class        = var.db_server_class
  allocated_storage     = var.db_storage
  skip_final_snapshot   = true
}