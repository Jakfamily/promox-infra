terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}


resource "proxmox_lxc" "lxc" {
  for_each = var.lxc_list

  hostname    = each.value.name
  target_node = each.value.node
  clone       = each.value.template
  cores       = each.value.cores
  memory      = each.value.memory

  rootfs {
    storage = "local-lvm"
    size    = "${each.value.disk}G"
  }

  network {
    # Configurer l'interface réseau
    name   = "eth0"
    bridge = each.value.network
    ip     = each.value.ip # Utiliser l'adresse IP statique définie dans la liste
  }
}
