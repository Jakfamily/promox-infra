terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

resource "proxmox_vm_qemu" "vm" {
  for_each = var.vm_list

  name        = each.value.name
  target_node = each.value.node
  clone       = each.value.template
  cores       = each.value.cores
  memory      = each.value.memory

  disks {
    scsi {
      scsi0 {
        disk {
          size    = each.value.disk
          storage = "local-lvm"
        }
      }
    }
  }

  # Configuration de l'adresse IP statique
  ipconfig0 = "ip=${each.value.ip}/24"

  network {
    # Configurer l'interface réseau
    model  = "virtio" # Modèle de la carte réseau
    bridge = each.value.network
  }
}
