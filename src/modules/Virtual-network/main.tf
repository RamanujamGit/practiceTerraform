resource "azurerm_virtual_network" "vnet1" {
name                 = var.vnetName
location             = var.vnetRgLocation
resource_group_name  = var.vnetRgName
address_space        = var.addressSpace
dns_servers          = var.dnsServers

subnet {
      name = var.subnet1
      address_prefixes = var.ipSubnet1
}
subnet {
      name = var.subnet2
      address_prefixes = var.ipSubnet2
}


}