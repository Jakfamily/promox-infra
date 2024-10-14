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
  }))
}
