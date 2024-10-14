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

## Auteurs

- **jakfamily** - [GitHub](https://github.com/Jakfamily)

## Réseaux sociaux

- [Mon profil LinkedIn](https://www.linkedin.com/in/faria-jean-baptiste/)

## Ressources Utiles

Voici quelques ressources recommandées pour apprendre et approfondir vos connaissances sur Terraform et OpenTofu :

### Blogs

- [Blog de Stéphane Robert](https://blog.stephane-robert.info/) - Un excellent blog pour apprendre les concepts d'infrastructure as code, y compris Terraform et ses bonnes pratiques.

### Livres

- **Terraform** - Collection ENI : Un livre complet de la collection ENI pour comprendre et maîtriser Terraform dans un contexte DevOps. Idéal pour approfondir la gestion d'infrastructure avec des exemples concrets.

### Documentation Officielle

- [Documentation OpenTofu](https://docs.opentofu.org/) - La documentation officielle d'OpenTofu, utile pour tout ce qui concerne la configuration et les modules spécifiques.
- [Documentation Terraform](https://developer.hashicorp.com/terraform/docs) - La documentation officielle de Terraform, indispensable pour comprendre les concepts fondamentaux et les ressources disponibles.

Ces ressources sont parfaites pour vous accompagner dans votre apprentissage d'Infrastructure as Code (IaC) avec Terraform et OpenTofu.
