
resource "azurerm_eventhub_namespace" "EvntHubNS" {
  name                = var.Namespace_name
  location            = var.EventHubRgLocation
  resource_group_name = var.EventHubRgName
  sku                 = var.pricingTier
  capacity            = var.ThroughputUnits

  tags = {
    environment = "dev"
  }
}

resource "azurerm_eventhub" "EvntHub" {
  name              = var.Eventhub_name
  namespace_id      = azurerm_eventhub_namespace.EvntHubNS.id
  partition_count   = var.partitionCount
  message_retention = var.messageRetention
}


resource "azurerm_eventhub_namespace_schema_group" "EHSchemaGroup" {
  name                 = "example-schemaGroup"
  namespace_id         = azurerm_eventhub_namespace.EvntHubNS.id
  schema_compatibility = "Forward"
  schema_type          = "Avro"
}


resource "azurerm_eventhub_consumer_group" "cg" {
  name                = "cg-demo"
  namespace_name      = azurerm_eventhub_namespace.EvntHubNS.name
  eventhub_name       = azurerm_eventhub.EvntHub.name
  resource_group_name = var.EventHubRgName
}