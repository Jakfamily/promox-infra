terraform {
  required_providers {
    proxmox = {
      source  = ""
      version = ""
    }
  }
}

provider "proxmox" {
  pm_api_url      = var.proxmox_url
  pm_user         = var.proxmox_user
  pm_password     = var.proxmox_password
  pm_tls_insecure = var.proxmox_tls_insecure
}

module "vm" {
  source  = "./modules/vm_module"
  vm_list = var.vm_list
}

module "lxc" {
  source   = "./modules/lxc_module"
  lxc_list = var.lxc_list
}
