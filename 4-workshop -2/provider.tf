terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.0.0"
    }
     random = {
      source  = "hashicorp/random"
      version = "3.9.1"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {

  }
  subscription_id = "0efc1bfe-4f3f-4361-b143-b737300e5e14"


}

provider "random" {
  # Configuration options
}

provider "azurerm" {
  alias = "shared"
}

# tes
$test123