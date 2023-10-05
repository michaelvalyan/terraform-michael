

resource "aws_instance" "infra_ec2" {
  ami           = var.system_ami
  instance_type = var.system_type
  subnet_id     = var.infra_subnet_id
  key_name      = var.ssh_key_name
  vpc_security_group_ids = [var.sg_id]

  tags = {
    Name = var.instance_name
  }
}