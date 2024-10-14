resource "proxmox_vm_qemu" "vm" {
  for_each = var.vm_list

  name     = each.value.name
  node     = each.value.node
  template = each.value.template
  cores    = each.value.cores
  memory   = each.value.memory
  disk     = each.value.disk
  network  = each.value.network
}
