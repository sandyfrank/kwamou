# 📝 Commandes Git Utiles

## Configuration initiale

### Configurer votre identité Git (si pas encore fait)
```bash
git config --global user.name "Votre Nom"
git config --global user.email "votre.email@example.com"
```

### Vérifier la configuration
```bash
git config --list
```

## Commandes de base

### Voir l'état des fichiers
```bash
git status
```

### Voir l'historique des commits
```bash
git log --oneline --graph --all
```

### Voir les différences
```bash
git diff                    # Modifications non stagées
git diff --staged          # Modifications stagées
```

## Workflow de déploiement

### Méthode 1 : Utiliser le script automatique (recommandé)
```bash
./check.sh                 # Vérifier l'état du projet
./deploy.sh "Votre message de commit"
```

### Méthode 2 : Commandes manuelles
```bash
# 1. Voir les modifications
git status

# 2. Ajouter les fichiers
git add .                  # Tout ajouter
# ou
git add fichier.html       # Ajouter un fichier spécifique

# 3. Commit
git commit -m "Description de vos modifications"

# 4. Push
git push origin main
```

## Gestion des branches

### Créer une nouvelle branche
```bash
git checkout -b nouvelle-branche
```

### Changer de branche
```bash
git checkout main
git checkout autre-branche
```

### Voir toutes les branches
```bash
git branch -a
```

### Fusionner une branche
```bash
git checkout main
git merge autre-branche
```

## Commandes avancées

### Annuler les modifications locales (non committées)
```bash
git restore fichier.html           # Annuler un fichier
git restore .                      # Annuler tout
```

### Modifier le dernier commit
```bash
git commit --amend -m "Nouveau message"
```

### Annuler le dernier commit (garder les modifications)
```bash
git reset --soft HEAD~1
```

### Voir les fichiers ignorés par .gitignore
```bash
git status --ignored
```

## Remote (dépôt distant)

### Ajouter un remote
```bash
git remote add origin https://github.com/username/repo.git
```

### Voir les remotes
```bash
git remote -v
```

### Changer l'URL du remote
```bash
git remote set-url origin https://github.com/username/nouveau-repo.git
```

### Supprimer un remote
```bash
git remote remove origin
```

## Pull (récupérer les modifications)

### Récupérer et fusionner
```bash
git pull origin main
```

### Récupérer sans fusionner
```bash
git fetch origin
```

## Tags (versions)

### Créer un tag
```bash
git tag -a v1.0.0 -m "Version 1.0.0"
```

### Pousser les tags
```bash
git push origin --tags
```

### Voir tous les tags
```bash
git tag -l
```

## Nettoyage

### Nettoyer les fichiers non suivis
```bash
git clean -fd              # Supprimer fichiers et dossiers non suivis
git clean -n               # Voir ce qui serait supprimé (dry-run)
```

### Supprimer les branches locales fusionnées
```bash
git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
```

## Résolution de problèmes

### Erreur "fatal: remote origin already exists"
```bash
git remote remove origin
git remote add origin <nouvelle-url>
```

### Conflits lors du merge
```bash
# 1. Ouvrir les fichiers en conflit et les résoudre
# 2. Ajouter les fichiers résolus
git add .
# 3. Continuer le merge
git commit
```

### Revenir à un commit précédent
```bash
git log                    # Trouver le hash du commit
git checkout <hash>        # Voir ce commit
git checkout main          # Revenir à main
```

## Alias utiles (optionnels)

Ajouter des raccourcis :

```bash
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.unstage 'reset HEAD --'
git config --global alias.last 'log -1 HEAD'
git config --global alias.lg 'log --oneline --graph --all'
```

Utilisation :
```bash
git st              # au lieu de git status
git lg              # historique visuel
```

## 🔗 Ressources

- [Documentation Git officielle](https://git-scm.com/doc)
- [GitHub Docs](https://docs.github.com)
- [Git Cheat Sheet](https://education.github.com/git-cheat-sheet-education.pdf)

## ⚠️ Important

- Toujours faire `git status` avant de commit
- Écrire des messages de commit clairs et descriptifs
- Ne jamais commit de mots de passe ou clés API
- Utiliser `.gitignore` pour exclure les fichiers sensibles
