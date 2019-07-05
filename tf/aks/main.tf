provider "azurerm" {
  version = "~>1.30"
}

terraform {
  backend "azurerm" {}
}

module "aks" {
  source                          = "git@github.com:jcorioland/terraform-azure-ref-aks-module"
  environment                     = "${var.environment}"
  location                        = "${var.location}"
  kubernetes_version              = "${var.kubernetes_version}"
  ssh_public_key                  = "${file("~/.ssh/id_rsa.pub")}"
  service_principal_client_id     = "${var.service_principal_client_id}"
  service_principal_client_secret = "${var.service_principal_client_secret}"
}