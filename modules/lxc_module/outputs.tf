output "lxc_ids" {
  description = "Liste des IDs des conteneurs LXC créés"
  value       = [for lxc in proxmox_lxc.lxc : lxc.id]
}
