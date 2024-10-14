output "vm_ids" {
  description = "Liste des IDs des VM créées"
  value       = [for vm in proxmox_vm_qemu.vm : vm.id]
}
