variable "rg_name" {
    type   =   string
    description = "This is the name of resource group"
}

variable "location" {
    type   =  string
    description = "location of resource group"
}

variable "vnetName" {
    type  = string
    description  =  "vnet name"
}

variable "dnsServers" {
    type = list
    description = "dns servers ip"
}

variable "subnet1Name" {
    type = string
    description = "subnet1 name"
}


variable "subnet2Name" {
    type = string
    description = "subnet2 name"
}

variable "ipsubnet1" {
    type = list
    description = "subnet1 addrees prefix"
}


variable "ipsubet2" {
    type  =  list
    description = "subnet2 addrees prefix"
}

variable "addressSpace" {
    type = list
    description = "Enter address space"
}