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



locals {
  namespaces = [
    {
      name                = "Multinamespace1"
      resource_group_name = module.resourceGroup.resourceGroupName
      location            = module.resourceGroup.resourceGroupLocation
      sku                 = "Standard"
      capacity            = 1
      eventhubs = [
        { name = "hub1", partition_count = 2, message_retention = 1 },
        { name = "hub2", partition_count = 4, message_retention = 3 }
      ]
    },
    {
      name                = "multinamespace2"
      resource_group_name = module.resourceGroup.resourceGroupName
      location            = module.resourceGroup.resourceGroupLocation
      sku                 = "Standard"
      capacity            = 2
      eventhubs = [
        { name = "hub3", partition_count = 2, message_retention = 2 }
      ]
    }
  ]
}


module "EventHub_Azure" {
    source = "./modules/Event-hub"
    namespaces = local.namespaces
}


module "AzureDNS" {
    source = "./modules/AzureDNS"
    DNS_Name = "privatednszone.app"
    DNS_rg_Name = module.resourceGroup.resourceGroupName
    vnetId = module.vnet1.vnetId
    vnetLinkName = "vnet-link1"
    recordSetName = "rset1"
    IpAddress = ["10.1.1.11"]

}


module "prEndpoint" {
    source = "./modules/Private-End-Point"
    privateEndpointName = "Eventhub_Endpoint"
    prEndPoint_rg_name = module.resourceGroup.resourceGroupName
    prEndPoint_rg_location = module.resourceGroup.resourceGroupLocation
    subnet_id = module.vnet1.subnet1_id
    PscName = "eventhub-psc"
    EventhubNSid = values(module.EventHub_Azure.Eventhub_ns_id)
    prDNSZoneID = [module.AzureDNS.privateDNSzoneID]


}