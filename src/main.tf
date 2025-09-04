module "devmodule" {
  source = ./modules/resource-group
  name_rg = var.rg_name
  location = var.location
}
