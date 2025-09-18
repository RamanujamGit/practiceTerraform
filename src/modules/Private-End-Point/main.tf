resource "azurerm_private_endpoint" "eventhub_pe" {
  name                = var.privateEndpointName
  location            = var.prEndPoint_rg_location
  resource_group_name = var.prEndPoint_rg_name
  subnet_id           = var.subnet_id  # Pass this as a variable

  private_service_connection {
    name                           = var.PscName
    private_connection_resource_id = EventhubNSid
    subresource_names              = ["namespace"]
    is_manual_connection           = false
  }
}

resource "azurerm_private_dns_zone_group" "eventhub_dns_group" {
  name                 = "eventhub-dns-group"
  private_endpoint_id  = azurerm_private_endpoint.eventhub_pe.id

  private_dns_zone_configs {
    name                  = "eventhub-dns-zone"
    private_dns_zone_id   = var.prDNSZoneID  # Pass your DNS zone ID as a variable
  }
}