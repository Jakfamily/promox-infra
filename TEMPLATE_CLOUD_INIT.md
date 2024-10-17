# Documentation : Création d'un Template Cloud-Init sur Proxmox

## Introduction

Cette documentation décrit les étapes nécessaires pour créer un template Cloud-Init sur Proxmox. Ce template permettra de déployer facilement des machines virtuelles (VM) avec des configurations personnalisées.

## Prérequis

- Accès à une installation de Proxmox.
- Une image ISO de Debian ou Ubuntu.
- Connaissances de base sur l'interface Proxmox et les commandes Linux.

## Étapes de Création du Template

### 1. Créer une Nouvelle VM

1. Connectez-vous à l'interface Proxmox.
2. Cliquez sur **Créer VM**.
3. Configurez les spécifications de la VM :
   - **Nom** : Choisissez un nom pour la VM.
   - **Système d'exploitation** : Sélectionnez l'image ISO de Debian ou Ubuntu.
   - **CPU, RAM et Disque** : Ajustez les ressources selon vos besoins.

### 2. Installer le Système d'Exploitation

1. Démarrez la VM et suivez le processus d'installation.
2. Configurez les paramètres de base (utilisateur, mot de passe, etc.).

### 3. Installer Cloud-Init

Après l'installation, connectez-vous à la VM et installez Cloud-Init :

```bash
sudo apt update
sudo apt install cloud-init
```

### 4. Configurer Cloud-Init

1. Modifiez le fichier de configuration de Cloud-Init :

```bash
sudo nano /etc/cloud/cloud.cfg
```

2. Ajoutez ou modifiez les paramètres nécessaires pour votre configuration réseau.

### 5. Éteindre la VM

Une fois la configuration terminée, éteignez la VM :

```bash
sudo shutdown now
```

### 6. Convertir la VM en Template

1. Dans l'interface Proxmox, faites un clic droit sur la VM.
2. Sélectionnez **Convertir en modèle** (ou **Convert to Template**).

## Utilisation du Template Cloud-Init

Après avoir créé le template, vous pouvez l'utiliser pour déployer de nouvelles VMs avec des configurations spécifiques.

### Exemple de Configuration Terraform

Voici un exemple de configuration Terraform pour créer une VM à partir de votre template Cloud-Init :

```hcl
resource "proxmox_vm_qemu" "vm" {
  name        = "ma-nouvelle-vm"
  target_node = "pve"  # Votre nœud Proxmox
  clone       = "nom_du_template"  # Le nom de votre template Cloud-Init
  cores       = 2
  memory      = 2048

  # Configuration de l'IP
  ipconfig0 = "ip=192.168.1.100/24"  # Remplacez par l'IP souhaitée

  network {
    model  = "virtio"  # Modèle de la carte réseau
    bridge = "vmbr0"   # Remplacez par le bon bridge
  }

  # Configuration de l'automatisation
  provisioner "local-exec" {
    command = "pvesh create /nodes/pve/qemu/${self.id}/status/start"
  }
}
```

## Conclusion

Cette documentation vous guide à travers le processus de création d'un template Cloud-Init sur Proxmox. Vous pouvez maintenant déployer des VMs rapidement avec des configurations personnalisées. Si vous avez des questions ou des problèmes, n'hésitez pas à demander de l'aide.
