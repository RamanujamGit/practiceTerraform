variable "DNS_Name" {
    type = string
    description = "This is Private DNS name"

}

variable "DNS_rg_Name" {
    type = string
    description = "This is eventhub resource group name"
}

variable "vnetId" {
    type = string
    description = "Te id for the virtual network"
}

variable "vnetLinkName" {
    type = string
    description = "This is the vnet link name"
}