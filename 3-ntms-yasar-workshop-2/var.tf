variable "BU" {
    description = "The name of the resource group"
    type        = string
    
  
}

variable "location" {
    description = "The location of the resource group"
    type        = string
   
  
}



variable "vnet_address_space" {
    description = "The address space of the virtual network"
    type        = list(string)
   

}


variable "subnet_address_prefixes" {
    description = "The address prefixes of the subnet"
    type        = list(string)
  

}



variable "owner" {
    description = "The name of the HTTP security rule"
    type        = string
   
 }

variable "env" {
    description = ""
    type        = string
   
 }
