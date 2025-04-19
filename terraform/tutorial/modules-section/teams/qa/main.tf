module "ec2" {
  source = "../../modules/ec2"
  instance_type = var.instance_type
  aws_region = var.aws_region
  ami_filter_name = var.ami_filter_name
  ami_owners = var.ami_owners
  environment = var.environment
  instance_name_tag = var.instance_name_tag
  output_dir = var.output_dir
  output_file = var.output_file
}

# Should define region in the team's folder not define it in module
provider "aws" {
  region = var.aws_region
}

