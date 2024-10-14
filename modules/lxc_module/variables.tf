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
  }))
}
