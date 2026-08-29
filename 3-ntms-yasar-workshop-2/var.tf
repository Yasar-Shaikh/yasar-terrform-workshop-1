variable "rg_name" {
    description = "The name of the resource group"
    type        = string
    default     = "yasar-ntmstf-rg"
  
}

variable "location" {
    description = "The location of the resource group"
    type        = string
    default     = "West US"
  
}

variable "vnet_name" {
    description = "The name of the virtual network"
    type        = string
    default     = "yasar-vnet"
  
}