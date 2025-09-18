variable "privateEndpointName" {
    type = string
    description = "This is the name of private endpoint"
}

variable "prEndPoint_rg_name" {
    type = string
    description = "Resource group of private endpoint"
}

variable "prEndPoint_rg_location" {
    type = string
    description = "This is resource group location"
}


variable "subnet_id" {
    type = string
    description = "This is subnet id"
}

variable "PscName" {
    type = string
    description = "This is name of private service connection"
}

variable "EventhubNSid" {
    type = string
    description = "This is eventhub namespace id"
}


variable "prDNSZoneID" {
    type = string
    description = "DNS zone id"
}


