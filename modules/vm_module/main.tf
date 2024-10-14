resource "proxmox_vm_qemu" "vm" {
  for_each = var.vm_list

  name     = each.value.name
  node     = each.value.node
  template = each.value.template
  cores    = each.value.cores
  memory   = each.value.memory

  # Définir la taille du disque
  disk {
    size = "${each.value.disk}G" # Taille du disque en Go
  }

  network {
    # Configurer l'interface réseau
    model  = "virtio" # Modèle de la carte réseau
    bridge = each.value.network
    ip     = each.value.ip # Utiliser l'adresse IP statique définie dans la liste
  }
}
