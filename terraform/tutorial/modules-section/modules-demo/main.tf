

module "cloud_infra" {
  source        = "./modules/wrapper"
  provider_type = var.provider_type
}
