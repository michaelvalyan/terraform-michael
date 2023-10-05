
resource "aws_key_pair" "infra_ssh_key" {
  key_name   = var.infra_key_name
  public_key = var.infra_public_key
}

