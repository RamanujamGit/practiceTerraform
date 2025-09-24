
resource "azurerm_eventhub_namespace" "EvntHubNS" {
  for_each            = { for ns in var.namespaces : ns.name => ns }
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = each.value.sku
  capacity            = each.value.capacity

  tags = {
    environment = "dev"
  }
}

resource "azurerm_eventhub" "EvntHub" {
  for_each = {
    for ns in var.namespaces :
    for eh in ns.eventhubs :
    "${ns.name}/${eh.name}" => {
      namespace_id        = azurerm_eventhub_namespace.EvntHubNS[ns.name].id
      name               = eh.name
      partition_count    = eh.partition_count
      message_retention  = eh.message_retention
      resource_group_name = ns.resource_group_name
      namespace_name      = ns.name
    }
  }
  name              = each.value.name
  namespace_id      = each.value.namespace_id
  partition_count   = each.value.partition_count
  message_retention = each.value.message_retention
}


resource "azurerm_eventhub_namespace_schema_group" "EHSchemaGroup" {
  for_each             = azurerm_eventhub_namespace.EvntHubNS
  name                 = "example-schemaGroup"
  namespace_id         = azurerm_eventhub_namespace.EvntHubNS.id
  schema_compatibility = "Forward"
  schema_type          = "Avro"
}


resource "azurerm_eventhub_consumer_group" "cg" {
  for_each = azurerm_eventhub.EvntHub
  name                = "cg-demo"
  namespace_name      = azurerm_eventhub_namespace.EvntHubNS.name
  eventhub_name       = azurerm_eventhub.EvntHub.name
  resource_group_name = var.EventHubRgName
}