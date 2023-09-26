terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

####################################### Variable Declaration
variable "ami_id" {
  type = string
  default = "ami-03a6eaae9938c858c"
}

variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "ssh_key_name" {
  type = string
  default = "aws-dev-acct-ssh-key"
}

#######################################

resource "aws_instance" "my_first_instance" {
  ami           = var.ami_id # this is how we reference the variable in the code
  instance_type = var.instance_type
  key_name = var.ssh_key_name

  tags = {
    Name = "terrafom-demo-1"
  }
}
#######################################
resource "aws_instance" "my_second_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = var.ssh_key_name

  tags = {
    Name = "terrafom-demo-2"
  }
}

resource "aws_instance" "my_third_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = var.ssh_key_name

  tags = {
    Name = "terrafom-demo-4"
  }
}
