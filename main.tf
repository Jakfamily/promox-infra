terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc3"
    }
  }
  required_version = ">= 0.12"
}

provider "proxmox" {
  pm_api_url          = var.proxmox_url
  pm_api_token_id     = var.proxmox_user
  pm_api_token_secret = var.proxmox_password
  pm_tls_insecure     = var.proxmox_tls_insecure
}

module "vm" {
  source  = "./modules/vm_module"
  vm_list = var.vm_list
}
