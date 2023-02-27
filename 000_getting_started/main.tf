terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.56.0"
    }
  }
}

provider "aws" {
  # Configuration options
  profile = "default"
  region  = "eu-west-1"
}

# accessing variables from CLI or shared .tfvars file
variable "instance_type" {
  type = string
}

# local variables
locals {
  project_name = "Shubhanshu Aggarwal"
}

resource "aws_instance" "my_server" {
  ami           = "ami-06e0ce9d3339cb039"
  instance_type = var.instance_type

  tags = {
    "Name" = "MyServer-${local.project_name}"
  }
}

# terraform output
output "instance_public_ip" {
  value = aws_instance.my_server.public_ip 
}