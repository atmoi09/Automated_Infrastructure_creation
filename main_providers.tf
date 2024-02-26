terraform {
  backend "azurerm" {
    resource_group_name   = "rg-thesis"
    storage_account_name  = "storageaccountrgthesis"
    container_name        = "terraform-state"
    key                   = "terraform.tfstate"
  }

  required_version = ">= 0.14.8"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.67.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.2.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.3.2"
    }
  }

}


provider "azurerm" {
  features {}

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

provider "kubernetes" {
  host                   = module.aks.aks_config.host
  client_certificate     = base64decode(module.aks.aks_config.client_certificate)
  client_key             = base64decode(module.aks.aks_config.client_key)
  cluster_ca_certificate = base64decode(module.aks.aks_config.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = module.aks.aks_config.host
    client_certificate     = base64decode(module.aks.aks_config.client_certificate)
    client_key             = base64decode(module.aks.aks_config.client_key)
    cluster_ca_certificate = base64decode(module.aks.aks_config.cluster_ca_certificate)
  }
}


data "azurerm_client_config" "current" {}