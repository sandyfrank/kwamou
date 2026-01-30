# 🔄 Résolution de la Divergence avec GitHub

Votre dépôt local a été restructuré, mais le dépôt GitHub contient encore l'ancienne structure.

## 📊 Situation actuelle

**Local (votre machine) :**
```
.
├── index.html
├── pages/              ← Nouvelle structure
│   └── *.html
├── assets/             ← Nouvelle structure
│   ├── css/
│   ├── images/
│   └── js/
└── .github/workflows/  ← CI/CD ajouté
```

**Remote (GitHub) :**
```
.
├── index.html
├── education.html      ← Ancienne structure
├── experience.html     ← Ancienne structure
├── styles.css          ← Ancienne structure
└── ...
```

---

## ✅ Solution : Mise à jour complète du dépôt GitHub

### Étape 1 : Configurer le remote (si nécessaire)

```bash
# Vérifier le remote actuel
git remote -v

# Si vide, ajouter le remote (remplacez USERNAME par votre nom d'utilisateur GitHub)
git remote add origin https://github.com/USERNAME/kwamou.git

# Si déjà configuré mais mauvaise URL
git remote set-url origin https://github.com/USERNAME/kwamou.git
```

### Étape 2 : Récupérer l'état actuel du remote

```bash
git fetch origin
```

### Étape 3 : Voir la divergence

```bash
git status
git log --oneline --graph --all
```

---

## 🎯 Option A : Remplacer complètement le contenu GitHub (RECOMMANDÉ)

**Utilisez cette option si :** vous voulez que GitHub ait exactement la même structure que votre version locale.

```bash
# 1. Ajouter tous vos changements
git add .

# 2. Commiter
git commit -m "Restructuration complète du site avec CI/CD

- Réorganisation en dossiers pages/ et assets/
- Ajout de styles modernes et responsive
- Configuration GitHub Actions pour déploiement automatique
- Ajout de la documentation"

# 3. Forcer le push (remplace le contenu distant)
git push -f origin main
```

**⚠️ ATTENTION :** Cela va écraser l'historique distant avec votre version locale.

---

## 🎯 Option B : Fusionner les changements

**Utilisez cette option si :** vous voulez conserver l'historique GitHub et fusionner.

```bash
# 1. Pull avec stratégie theirs (prend votre version en cas de conflit)
git pull origin main --allow-unrelated-histories -X ours

# 2. Résoudre les conflits manuellement si nécessaire
# Éditez les fichiers en conflit, puis :
git add .

# 3. Terminer le merge
git commit -m "Merge: Nouvelle structure du site"

# 4. Push
git push origin main
```

---

## 🎯 Option C : Créer une nouvelle branche

**Utilisez cette option si :** vous voulez tester avant de remplacer main.

```bash
# 1. Créer une branche pour la nouvelle structure
git checkout -b restructure

# 2. Ajouter et commiter
git add .
git commit -m "Nouvelle structure du site"

# 3. Push la nouvelle branche
git push -u origin restructure

# 4. Sur GitHub, créer une Pull Request
# 5. Après vérification, merger dans main
```

---

## 🚀 Après la synchronisation

### 1. Activer GitHub Pages

1. Allez sur GitHub : `https://github.com/USERNAME/kwamou`
2. Cliquez sur **Settings** > **Pages**
3. Sous **Source**, sélectionnez **GitHub Actions**
4. Sauvegardez

### 2. Configurer les permissions

1. **Settings** > **Actions** > **General**
2. Sous **Workflow permissions** :
   - ✅ Sélectionnez "Read and write permissions"
   - ✅ Cochez "Allow GitHub Actions to create and approve pull requests"
3. Sauvegardez

### 3. Déclencher le premier déploiement

Le workflow se lance automatiquement, ou déclenchez-le manuellement :
1. Allez dans **Actions**
2. Sélectionnez "Deploy to GitHub Pages"
3. Cliquez sur "Run workflow"

### 4. Vérifier le déploiement

- Attendez 2-3 minutes
- Votre site sera disponible à : `https://USERNAME.github.io/kwamou/`

---

## 📝 Commandes rapides

### Si vous choisissez l'Option A (Recommandé) :

```bash
# Tout en une fois
git add .
git commit -m "Restructuration complète avec CI/CD"
git push -f origin main
```

### Vérifier ensuite :

```bash
# Voir le statut
git status

# Voir l'historique
git log --oneline
```

---

## 🆘 En cas de problème

### Erreur "repository not found"
```bash
# Vérifier/corriger l'URL
git remote set-url origin https://github.com/VOTRE-USERNAME/kwamou.git
```

### Erreur d'authentification
```bash
# Utiliser un token d'accès personnel (PAT)
# Créez un PAT sur GitHub : Settings > Developer settings > Personal access tokens
# Utilisez le PAT comme mot de passe lors du push
```

### Reset complet (si nécessaire)
```bash
# Supprimer le remote et recommencer
git remote remove origin
git remote add origin https://github.com/USERNAME/kwamou.git
```

---

## 💡 Recommandation

**Je recommande l'Option A** car :
- ✅ Plus simple et direct
- ✅ Votre nouvelle structure est meilleure
- ✅ Vous avez déjà tout le contenu localement
- ✅ L'ancien historique n'est pas critique

**Commande complète :**
```bash
git add .
git commit -m "Restructuration complète du site avec CI/CD et design moderne"
git push -f origin main
```

Ensuite, activez GitHub Pages et votre site sera en ligne ! 🎉
