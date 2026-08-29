variable "BU" {
    description = "The name of the resource group"
    type        = string
    default     = "IT-infra"
  
}

variable "location" {
    description = "The location of the resource group"
    type        = string
    default     = "West US"
  
}



variable "vnet_address_space" {
    description = "The address space of the virtual network"
    type        = list(string)
    default     = ["10.1.0.0/16"]

}


variable "subnet_address_prefixes" {
    description = "The address prefixes of the subnet"
    type        = list(string)
    default     = ["10.1.1.0/24"]

}



variable "owner" {
    description = "The name of the HTTP security rule"
    type        = string
    default     = "yasar"
 }

variable "env" {
    description = ""
    type        = string
    default     = "dev"
 }
