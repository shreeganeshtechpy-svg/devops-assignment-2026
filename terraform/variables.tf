variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name used for tagging resources"
  type        = string
  default     = "devsecops-app"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "Ubuntu 22.04 LTS AMI ID for ap-south-1"
  type        = string
  default     = "ami-0f58b397bc5c1f2e8"
}

variable "public_key" {
  description = "SSH public key for EC2 key pair"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC0 placeholder-replace-with-real-key"
}
