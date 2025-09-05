module "resourceGroup" {
    source = "./modules/resource-group"
    rg_name = var.rg_name
    location = var.location

}


module "vnet1" {
    source = "./modules/virtual-network"
    vnetName = var.vnetName
    dnsServers = var.dnsServers
    addressSpace = var.addressSpace
    subnet1Name = var.subnet1Name
    subnet2Name = var.subnet2Name
    ipSubnet1 = var.ipSubnet1
    ipSubnet2 = var.ipSubnet2
}