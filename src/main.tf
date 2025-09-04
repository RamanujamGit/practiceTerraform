module "devmodule" {
  source = "./modules/resource-group"
  rg_name = var.rg_name
  location = var.location
}
