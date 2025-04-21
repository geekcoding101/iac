module "aws" {
  source = "../aws_module"
  count  = var.provider_type == "aws" ? 1 : 0
}

module "azure" {
  source = "../azure_module"
  count  = var.provider_type == "azure" ? 1 : 0
}
