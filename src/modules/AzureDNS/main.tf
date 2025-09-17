resource "azurerm_private_dns_zone" "example" {
  name                = var.DNS_Name
  resource_group_name = var.DNS_rg_Name
}

locals {
    PrZoneName = azurerm_private_dns_zone.example.name
    PrZoneRGname = azurerm_private_dns_zone.example.resource_group_name
}


resource "azurerm_private_dns_zone_virtual_network_link" "vnetlink" {
  name                  = var.vnetLinkName
  resource_group_name   = local.PrZoneRGname
  private_dns_zone_name = local.PrZoneName
  virtual_network_id    = var.vnetId   # Pass your VNet ID as a variable or output
  registration_enabled  = false
}