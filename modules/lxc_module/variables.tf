variable "lxc_list" {
  description = "Liste des conteneurs LXC"
  type = map(object({
    name     = string
    node     = string
    template = string
    cores    = number
    memory   = number
    disk     = number
    network  = string
    ip       = string
  }))

  validation {
    condition = alltrue([for lxc in values(var.lxc_list) : can(regex("^(?:[0-9]{1,3}\\.){3}[0-9]{1,3}$", lxc.ip))])
    error_message = "Chaque adresse IP doit être une adresse IPv4 valide."
  }
}
