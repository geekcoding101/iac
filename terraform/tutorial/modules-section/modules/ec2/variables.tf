variable "aws_region" {
  description = "AWS region to deploy resources"
}

variable "instance_type" {
  description = "EC2 instance type"
}

variable "ami_filter_name" {
  description = "Filter name for the AMI"
}

variable "ami_owners" {
  description = "Owners of the AMI"
  type        = list(string)
}

variable "environment" {
  description = "Environment tag for the EC2 instance"
}

variable "instance_name_tag" {
  description = "Name tag for the EC2 instance"
}

variable "output_dir" {
  description = "Base directory for output files"
  default     = "output"
}

variable "output_file" {
  description = "Name of the output file"
  default     = "ec2_instance_info.txt"
}