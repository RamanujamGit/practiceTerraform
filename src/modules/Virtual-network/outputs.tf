output "vnetId" {
    value = azurerm_virtual_network.vnetwork1.id
}


output "subnet1_id" {
  value = tolist(azurerm_virtual_network.vnetwork1.subnet)[0].id
}

output "subnet2_id" {
  value = tolist(azurerm_virtual_network.vnetwork1.subnet)[1].id
}