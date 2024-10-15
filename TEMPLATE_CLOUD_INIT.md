# Documentation pour la création d'un Template Cloud-Init sur Proxmox

## Configurer l'image avec virt-customize

Installez le paquet nécessaire si ce n'est pas déjà fait :

```bash
apt update
apt install -y libguestfs-tools
```

Ensuite, utilisez `virt-customize` pour installer `qemu-guest-agent`, qui est nécessaire pour une meilleure intégration avec Proxmox :

```bash
virt-customize -a debian-12-generic-amd64.qcow2 --install qemu-guest-agent
```

## Créer la VM dans Proxmox

Connectez-vous à votre serveur Proxmox et créez une nouvelle VM :

```bash
qm create 666 --name debian12-cloudinit --net0 virtio,bridge=vmbr1 --scsihw virtio-scsi-single
```

## Configurer le disque et les ressources

Ajoutez le disque téléchargé et configurez-le comme suit :

```bash
qm set 666 --scsi0 local:0,iothread=1,backup=off,format=qcow2,import-from=/root/debian-12-generic-amd64.qcow2
qm disk resize 666 scsi0 20G
```

Configurez également les ressources de la VM (CPU, RAM) :

```bash
qm set 666 --cpu host --cores 2 --memory 4096
```

Ajoutez un disque Cloud-Init :

```bash
qm set 666 --ide2 local:cloudinit
qm set 666 --agent enabled=1
```

## Convertir la VM en Template

Enfin, convertissez la VM en template :

```bash
qm template 666
```

## Utilisation dans le Projet

Une fois que vous avez créé le template Cloud-Init, vous pouvez l'utiliser dans votre projet Terraform pour déployer des machines virtuelles (VM) et des conteneurs LXC. Voici comment configurer votre fichier `variables.tf` pour utiliser le template créé.

### Exemple de Configuration de Variables Terraform

Vous pouvez définir vos machines virtuelles et conteneurs LXC dans le fichier `variables.tf` comme suit :

```hcl
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

vm_list = {
  "vm1" = {
    name     = "VM1"
    node     = "pve"
    template = "debian12-cloudinit"
    cores    = 2
    memory   = 2048
    disk     = 20
    network  = "vmbr0"
  },
  "vm2" = {
    name     = "VM2"
    node     = "pve"
    template = "debian12-cloudinit"
    cores    = 4
    memory   = 4096
    disk     = 30
    network  = "vmbr0"
  }
}
```

### Déployer les VM et Conteneurs

Avec la configuration ci-dessus, vous pouvez déployer des VM et des conteneurs en utilisant les commandes Terraform habituelles :

```bash
terraform init
terraform apply
```

Cette configuration vous permet de personnaliser les ressources de chaque VM ou conteneur, écrasant les valeurs par défaut définies dans le template.

### Conclusion

L'utilisation de templates Cloud-Init avec Proxmox et Terraform facilite le déploiement rapide et la configuration des environnements. N'hésitez pas à adapter cette documentation en fonction de vos besoins spécifiques.
