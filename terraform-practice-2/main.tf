# Provider

terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "5.17.0"
    }
  }
}


# Region

provider "aws" {
  region                    = var.region_name
}

# Key Pair

resource "aws_key_pair" "my_ssh_key" {
  key_name   = var.my_ssh_key_name
  public_key = var.my_ssh_key_pub
}

# EC2 Instances

resource "aws_instance" "bastion_ec2" {
  ami                       = "ami-00c6177f250e07ec1" # Amazon Linux 2 AMI ID
  instance_type             = "t3.micro"
  subnet_id                 = aws_subnet.public_subnet_1.id
  key_name                  = aws_key_pair.my_ssh_key.key_name
  vpc_security_group_ids    = [aws_security_group.bastion_sg.id]
  
	tags = {
    Name                    = "bastion-ec2"
  }
}


resource "aws_instance" "web_ec2" {
  ami                       = "ami-00c6177f250e07ec1" # Amazon Linux 2 AMI ID
  instance_type             = "t3.micro"
  subnet_id                 = aws_subnet.public_subnet_2.id
  key_name                  = aws_key_pair.my_ssh_key.key_name
  vpc_security_group_ids    = [aws_security_group.web_sg.id]
  
	tags = {
    Name                    = "web-ec2"
  }

  user_data                 = <<-EOF
                                #!/bin/bash
                
                                yum install -y httpd
                                systemctl enable --now httpd

                            EOF
}


output "web_ec2_public_ip" {
  description               = "Public IP address of the web server EC2 instance"
  value                     = aws_instance.web_ec2.public_ip
}