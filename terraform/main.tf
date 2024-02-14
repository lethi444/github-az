terraform {
  backend "azurerm" {
    resource_group_name  = "terraformdemo1"
    storage_account_name = "terraformcodeops4"
    container_name       = "tfsstatefile"
    key                  = "dev.terraform.tfstate"
  }
}
module "RG" {
  source   = "./modules/RG" #A
  rgname   = var.rgname     #B
  location = var.location
}
module "SA" {
  source   = "./modules/StorageAccount"
  sname    = var.sname
  rgname   = var.rgname
  location = var.location
}
