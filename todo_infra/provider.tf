terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.39.0"
    }
  }
  
    backend "azurerm" {
    resource_group_name   = "todo_rg"     # RG jisme storage hai
    storage_account_name  = "backendstoragecicd"      # Storage account ka naam (unique hona chahiye)
    container_name        = "tfstate"                  # Blob container jisme state rakha jayega
    key                   = "terraform.tfstate"        # State file ka naam
  }

}

provider "azurerm" {
  features {}
  subscription_id = "4a8937a7-b294-4a1f-8d31-79bbb1a4c17f"
}