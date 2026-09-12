terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.8.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "backend_rohit_rg"
    storage_account_name = "backendrohitdhaka"
    container_name       = "backend-rohit-storage-container"
    key                  = "virtual_network.tfstate"

  }
}

provider "azurerm" {
  features {}
}