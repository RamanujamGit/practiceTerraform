output "Eventhub_ns_id" {
    value = { for k, ns in azurerm_eventhub_namespace.EvntHubNS : k => ns.id }
}