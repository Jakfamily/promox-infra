# Projet Auto-Host devops

## Description

Ce projet utilise OpenTofu pour gérer une infrastructure Proxmox, en séparant les responsabilités avec la création de modules pour les machines virtuelles (VM) et les conteneurs LXC.

## Structure du projet

- **main.tf** : Le fichier principal qui définit les ressources.
- **variables.tf** : Les variables utilisées dans le projet.
- **modules/** : Dossier contenant les modules pour les VMs et les LXC.

## Prérequis

- [OpenTofu](https://opentofu.org/)
- Proxmox VE
- Git
- Accès SSH au serveur Proxmox
- Les droits d'administration sur le serveur Proxmox

## Auteurs

- **jakfamily** - [GitHub](https://github.com/Jakfamily)

## Réseaux sociaux

- [Mon profil LinkedIn](https://www.linkedin.com/in/faria-jean-baptiste/)

## Ressources Utiles

Voici quelques ressources recommandées pour apprendre et approfondir vos connaissances sur Terraform et OpenTofu :

### Blogs

- [Blog de Stéphane Robert](https://blog.stephane-robert.info/) - Un excellent blog pour apprendre les concepts d'infrastructure as code, y compris Terraform et ses bonnes pratiques.
- [slash-root.fr](https://slash-root.fr/proxmox-template-debian12-avec-cloud-init/) - article pour la creation de template debian12 avec cloud-init

### Livres

- **L’infrastructure as Code avec Terraform-Déployez votre infrastructure sur le Cloud** - Collection ENI : Un livre complet de la collection ENI pour comprendre et maîtriser Terraform dans un contexte DevOps. Idéal pour approfondir la gestion d'infrastructure avec des exemples concrets.

### Video

- [Jim's Garage](https://www.youtube.com/@Jims-Garage)
- [Culture Linux](https://www.youtube.com/@culturelinux)

### Documentation Officielle

- [Documentation OpenTofu](https://docs.opentofu.org/) - La documentation officielle d'OpenTofu, utile pour tout ce qui concerne la configuration et les modules spécifiques.
- [Documentation Terraform](https://developer.hashicorp.com/terraform/docs) - La documentation officielle de Terraform, indispensable pour comprendre les concepts fondamentaux et les ressources disponibles.

Ces ressources sont parfaites pour vous accompagner dans votre apprentissage d'Infrastructure as Code (IaC) avec Terraform et OpenTofu.
