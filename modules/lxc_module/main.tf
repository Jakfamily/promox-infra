resource "proxmox_lxc" "lxc" {
  for_each = var.lxc_list

  name     = each.value.name
  node     = each.value.node
  template = each.value.template
  cores    = each.value.cores
  memory   = each.value.memory
  disk     = each.value.disk
  network  = each.value.network
}
