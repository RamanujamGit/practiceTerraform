
resource "azurerm_eventhub_namespace" "EvntHubNS" {
  name                = Namespace_name
  location            = var.EventHubRgLocation
  resource_group_name = var.EventHubRgName
  sku                 = var.pricingTier
  capacity            = var.ThroughputUnits

  tags = {
    environment = "dev"
  }
}

resource "azurerm_eventhub" "EvntHub" {
  name              = Eventhub_name
  namespace_id      = azurerm_eventhub_namespace.EvntHubNS.id
  partition_count   = var.partitionCount
  message_retention = var.messageRetention
}