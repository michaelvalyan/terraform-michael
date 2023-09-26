terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
          

variable "ec2_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "image_id" {
  description = "AMI ID"
  default     = "ami-03a6eaae9938c858c"
}


resource "aws_security_group" "http_sg" {
  name        = "http_sg"
  description = "Security Group for HTTP access"
  
  # Allow incoming HTTP traffic (port 80) from all IP addresses
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "example" {
  ami           = var.image_id
  instance_type = var.ec2_type

  # Associate the security group with the instance
  vpc_security_group_ids = [aws_security_group.http_sg.id]

  tags = {
    Name = "My-Terraform-Instance-1"
  }
}          
