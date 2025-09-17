resource "azurerm_private_dns_zone" "example" {
  name                = var.DNS_Name
  resource_group_name = var.DNS_rg_Name
}