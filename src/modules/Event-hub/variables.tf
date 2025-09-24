variable "EventHubRgName" {
    type = string
    description = "This is resource group name"
}

variable "EventHubRgLocation" {
    type = string
    description = "location where eventhub is created"
}


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

variable "Eventhub_name" {
    type = string
    description = "Eventhub name"
}

variable "pricingTier" {
    type = string
    description = "this is the pricingTier"
}

variable "ThroughputUnits" {
    type = number
    description = "Number of throughput Units"
}


variable "partitionCount" {
    type = number
    description = "Number of throughput Units"
}

variable "messageRetention" {
    type = number
    description = "Number of throughput Units"
}

