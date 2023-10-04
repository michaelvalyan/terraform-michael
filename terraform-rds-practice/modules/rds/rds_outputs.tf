output "rds_endpoint" {
  value = aws_db_instance.db_server.endpoint
}

output "rds_engine_type" {
  value = aws_db_instance.db_server.engine
}

output "rds_arn" {
  value = aws_db_instance.db_server.arn
}

