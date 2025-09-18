resource "azurerm_private_endpoint" "eventhub_pe" {
  name                = var.privateEndpointName
  location            = var.prEndPoint_rg_location
  resource_group_name = var.prEndPoint_rg_name
  subnet_id           = var.subnet_id  # Pass this as a variable

  private_service_connection {
    name                           = var.PscName
    private_connection_resource_id = var.EventhubNSid
    subresource_names              = ["namespace"]
    is_manual_connection           = false
  }

    private_dns_zone_group {
    name                 = "example-dns-zone-group"
    private_dns_zone_ids = var.prDNSZoneID
  }
}

 