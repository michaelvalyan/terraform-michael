provider "aws" {
  region              = "us-east-1"
}

module "network" {
  source              = "../modules/networking_components"
  infra_vpc_sidr      = var.network_vpc_sird
  infra_subnet_cidr   = var.network_subnet_cidr
  infra_subnet_az     = var.network_subnet_az
}

module "security_group" {
  source              = "../modules/security_group"
  infra_sg_name       = var.sg_name
  net_vpc_id          = module.network.infra_vpc_id
}

module "ssh_key" {
    source            = "../modules/ssh-key"
    infra_key_name    = var.ssh_key_name
    infra_public_key  = var.ssh_public_key
}

module "ec2" {
    source            = "../modules/ec2"
    system_ami        = var.ec2_ami
    system_type       = var.ec2_type
    infra_subnet_id   = module.network.infra_public_subnet_id
    ssh_key_name      = module.ssh_key.key_name
    sg_id             = module.security_group.infra_sg_id
    instance_name     = var.ec2_name
}

