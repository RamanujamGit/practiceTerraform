variable "EventHubRgName" {
    type = string
    description = "This is resource group name"
}

variable "EventHubRgLocation" {
    type = string
    description = "location where eventhub is created"
}


variable "Namespace_name" {
    type = string
    default = "This field is the name of the namespace"
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
    type = int
    description = "Number of throughput Units"
}


variable "partitionCount" {
    type = int
    description = "Number of throughput Units"
}

variable "messageRetention" {
    type = int
    description = "Number of throughput Units"
}

