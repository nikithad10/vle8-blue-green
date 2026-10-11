# VLE-8: Blue-Green Deployment using DevOps Tools
# Terraform configuration for documenting an existing AWS EC2 instance.
# This configuration does not create a new EC2 instance.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  description = "AWS region where the existing EC2 instance is running"
  type        = string
  default     = "us-east-1"
}

variable "existing_instance_id" {
  description = "Instance ID of the already running VLE-8 EC2 instance"
  type        = string
}

# Read information about the existing EC2 instance.
# This data source does not create a new instance.
data "aws_instance" "vle8_existing" {
  instance_id = var.existing_instance_id
}

output "existing_instance_id" {
  description = "ID of the existing VLE-8 EC2 instance"
  value       = data.aws_instance.vle8_existing.id
}

output "existing_instance_public_ip" {
  description = "Public IP of the existing VLE-8 EC2 instance"
  value       = data.aws_instance.vle8_existing.public_ip
}
