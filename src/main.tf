module "resourceGroup" {
    source = "./modules/resource-group"
    rg_name = "rg_eventhub"
    location = "West Europe"

}


module "vnet1" {
    source = "./modules/virtual-network"
    vnetRgName = module.resourceGroup.resourceGroupName
    vnetRgLocation = module.resourceGroup.resourceGroupLocation
    vnetName = "eventhub_virtualNetwork_test"
    dnsServers = ["10.1.0.4","10.1.0.5"]
    addressSpace = ["10.1.0.0/16"]
    subnet1Name = "EH_subnet1"
    subnet2Name = "EH_subnet2"
    ipSubnet1 = ["10.1.1.0/24"]
    ipSubnet2 = ["10.1.2.0/24"]
}


module "EventHub_Azure" {
    source = "./modules/Event-hub"
    Namespace_name = "learnEventhub-deveolpmentenv"
    Eventhub_name = "learnEventHub"
    EventHubRgName = module.resourceGroup.resourceGroupName
    EventHubRgLocation = module.resourceGroup.resourceGroupLocation
    pricingTier = "Standard"
    ThroughputUnits = 1
    partitionCount = 2
    messageRetention = 1


}


module "AzureDNS" {
    source = "./modules/AzureDNS"
    DNS_Name = "privatednszone.app"
    DNS_rg_Name = module.resourcegroup.resourceGroupName

}