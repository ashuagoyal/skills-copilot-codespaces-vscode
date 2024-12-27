# Define the provider
provider "azurerm" {
  features {}
}

# Define variables
variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "location" {
  description = "Location for the storage account"
  type        = string
  default     = "East US"
}

variable "sku" {
  description = "The SKU of the storage account"
  type        = string
  default     = "Standard_LRS"
}

# Define the resource for the storage account
resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = var.sku

  tags = {
    environment = "Terraform"
  }
}

# Define the resource group
resource "azurerm_resource_group" "rg" {
  name     = "example-resources"
  location = var.location
}

# Define outputs
output "storage_account_id" {
  value = azurerm_storage_account.storage.id
}

output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}