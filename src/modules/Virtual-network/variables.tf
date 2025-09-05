

variable "vnetName" {
    type  = string
    description  =  "vnet name"
}

variable "dnsServers" {
    type = list(string)
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

variable "ipSubnet1" {
    type = list(string)
    description = "subnet1 addrees prefix"
}


variable "ipSubet2" {
    type  =  list(string)
    description = "subnet2 addrees prefix"
}

variable "addressSpace" {
    type = list(string)
    description = "Enter address space"
}