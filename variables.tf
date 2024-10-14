variable "proxmox_url" {
  description = "L'URL de l'API Proxmox"
  type        = string
}

variable "proxmox_user" {
  description = "Nom d'utilisateur pour l'API Proxmox"
  type        = string
}

variable "proxmox_password" {
  description = "Mot de passe pour l'API Proxmox"
  type        = string
}

variable "proxmox_tls_insecure" {
  description = "Autoriser les connexions non sécurisées"
  type        = bool
}

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
