variable "vm_list" {
  description = "Liste des machines virtuelles"
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
    condition     = alltrue([for vm in values(var.vm_list) : can(regex("^(?:[0-9]{1,3}\\.){3}[0-9]{1,3}$", vm.ip))])
    error_message = "Chaque adresse IP doit être une adresse IPv4 valide."
  }
}
