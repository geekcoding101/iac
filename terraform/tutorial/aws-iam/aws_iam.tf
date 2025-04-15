terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

variable "user_prefix" {
  type    = string
  default = "terraform-user"
}

variable "user_count" {
  type    = number
  default = 3
}

resource "aws_iam_user" "terraform_user" {
  count = var.user_count

  name = "${var.user_prefix}-${count.index}"
}

variable "user_prefix_for_each" {
  type    = string
  default = "terraform-user-for-each"
}

variable "user_count_for_each" {
  type    = number
  default = 3
}

locals {
  user_names = [for i in range(var.user_count_for_each) : "${var.user_prefix_for_each}-${i}"]
}

resource "aws_iam_user" "terraform_user_for_each" {
  for_each = toset(local.user_names)

  name = each.value
}
