resource "proxmox_lxc" "lxc" {
  for_each = var.lxc_list

  hostname = each.value.name
  node     = each.value.node
  template = each.value.template
  cores    = each.value.cores
  memory   = each.value.memory

  # Définir la taille du système de fichiers racine
  rootfs = "${each.value.disk}G" # Utilisation de disk pour spécifier la taille

  network {
    # Configurer l'interface réseau
    name   = "eth0"
    bridge = each.value.network
    ip     = each.value.ip # Utiliser l'adresse IP statique définie dans la liste
  }
}
