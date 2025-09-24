
variable "namespaces" {
  description = "List of Event Hub namespaces and their event hubs"
  type = list(object({
    name                = string
    location            = string
    resource_group_name = string
    sku                 = string
    capacity            = number
    eventhubs = list(object({
      name              = string
      partition_count   = number
      message_retention = number
    }))
  }))
}



