terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  # Below settings have been defined in environment variables
  # export AWS_ACCESS_KEY_ID='your_access_key_id'
  # export AWS_SECRET_ACCESS_KEY='your_secret_access_key'
  # export AWS_DEFAULT_REGION='us-west-1'
  # export AWS_PROFILE="default"
  # export AWS_CONFIG_FILE="$HOME/.aws/config"
  # export AWS_SHARED_CREDENTIALS_FILE="$HOME/.aws/credentials"

}


data "aws_ami" "amazon_linux_2_free_tier" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

output "ami_id" {
  value = {
    ami_id                  = data.aws_ami.amazon_linux_2_free_tier.id
    ami_name                = data.aws_ami.amazon_linux_2_free_tier.name
    ami_virtualization_type = data.aws_ami.amazon_linux_2_free_tier.virtualization_type
    ami_state              = data.aws_ami.amazon_linux_2_free_tier.state
  }
}

resource "aws_iam_user" "terraform-user" {
  name = "terraform-user-${count.index}"
  count = 3
  path = "/system/"
}

output "iam_names" {
  value = aws_iam_user.terraform-user[*].name
}

output "iam_arns" {
  value = aws_iam_user.terraform-user[*].arn
}

# resource "aws_instance" "terraform-ec2" {
#   ami           = "ami-020fbc00dbecba358" # Amazon Linux 2023 AMI, free tier eligible
#   instance_type = "t2.micro"

#   tags = {
#     Name = "terraform-ec2-instance"
#   }
# }