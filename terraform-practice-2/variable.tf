
# REGION #############

variable "region_name" {
    description     = "name of your aws region"
    default         = "us-east-1"
}

# VPC #############

variable "vpc_name" {
    description     = "name of your vpc"
    default         = "my_vpc"
}

variable "vpc_cidr" {
    description     = "name of your vpc"
    default         = "10.0.0.0/16"
}

# SUBNETS #############

variable "subnet_one_name" {
    description     = "name of your vpc"
    default         = "tf_subnet_a"
}

variable "subnet_two_name" {
    description     = "name of your vpc"
    default         = "tf_subnet_b"
}

variable "subnet_one_cidr" {
    description     = "name of your vpc"
    default         = "10.0.1.0/24"
}

variable "subnet_two_cidr" {
    description     = "name of your vpc"
    default         = "10.0.2.0/24"
}

# KEY #############

variable "my_ssh_key_pub" {
    description     = "public key"
    default         = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDTAdW4ebNFCQoSMaVIbbKDbY3G4oryAhq4PpweXXhP8CvG5Lq3yNjTtNtBt7qiCwGki3zKjPuyz9rUJe+VkrkVgrtlMmZZj+zBWMKvZRBCVwQDV9RkR1diwNS1egDXlLWxMEHuwEKuL165APk/KTYt/ZTDpQ07pUYY6J6r44cZgAjlGkoDZ9Ng3Fb8rLhij5ba2R0KZlHDhwfRNAUwhKWYdWTeX59OkZtTpfLzMiB/tTjAt11n4kn7LtOw8T+YMzVw/1CeDU+NsYr7Mle8bYBudOHAdp2h0SYrMyDbmZKysffCJvrVElpGP0yb0lk4CPHqx/VBAMzGN6rpZ5evJyoMyWuyUnVBQgcNU509Vlxy3sX7/IAv2jWlQIcog8BXYHYcfjQrzEhgJpQ3BlQIacHXV26OQxENq8xh/DpFD/TU+4wZlSmLeF++SLyyES222i40ZyjRTMvUDIeryd/eCPMpFh4odikMU22e5egUrjjnGzRN+LXgIJi0Gn2aVtSt/m0= michaelmesropyan@MacBook-Air-4"
}


variable "my_ssh_key_name" {
    description     = "key name"
    default         = "ssh-key"
}
