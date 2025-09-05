resource "azurerm_virtual_network" "vnet1" {
name                 = var.vnetName
location             = azurerm_resource_group.RG2.location
resource_group_name  = azurerm_resource_group.RG2.name
address_space        = var.addressSpace
dns_servers          = var.dnsServers

subnet {
      name = var.subnet1
      address_prefixes = var.ipSubnet1
}
subnet {
      name = var.subnet2
      address_prefixes = var.ipsubet2
}


}