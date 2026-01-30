# 🚀 Guide de Déploiement GitHub Pages

## Étapes pour déployer votre site sur GitHub

### 1️⃣ Initialiser Git (si ce n'est pas déjà fait)

```bash
cd /home/kwamouns/Datas/hunting/kwamou
git init
git add .
git commit -m "Initial commit: Portfolio website with CI/CD"
```

### 2️⃣ Créer un dépôt sur GitHub

1. Allez sur [github.com](https://github.com)
2. Cliquez sur le **+** en haut à droite > **New repository**
3. Nommez votre repo (exemple: `portfolio`, `kwamou`, ou `your-username.github.io`)
4. Ne cochez PAS "Initialize with README" (vous en avez déjà un)
5. Cliquez sur **Create repository**

### 3️⃣ Lier votre repo local à GitHub

```bash
# Remplacez <username> et <repo-name> par vos valeurs
git remote add origin https://github.com/<username>/<repo-name>.git
git branch -M main
git push -u origin main
```

**Exemple :**
```bash
git remote add origin https://github.com/kwamou/portfolio.git
git branch -M main
git push -u origin main
```

### 4️⃣ Activer GitHub Pages

1. Allez sur votre repo GitHub
2. Cliquez sur **Settings** (Paramètres)
3. Dans le menu de gauche, cliquez sur **Pages**
4. Sous **Source**, sélectionnez **GitHub Actions**
5. Sauvegardez

### 5️⃣ Vérifier le déploiement

1. Allez dans l'onglet **Actions** de votre repo
2. Vous verrez un workflow "Deploy to GitHub Pages" en cours
3. Attendez qu'il soit vert (✓)
4. Retournez dans **Settings** > **Pages**
5. Votre site sera disponible à l'URL affichée !

**URL typique :**
- Si repo s'appelle `portfolio` : `https://<username>.github.io/portfolio/`
- Si repo s'appelle `<username>.github.io` : `https://<username>.github.io/`

### 6️⃣ Mettre à jour votre site

Après chaque modification :

```bash
git add .
git commit -m "Description de vos modifications"
git push origin main
```

Le site sera automatiquement redéployé en quelques minutes ! ✨

---

## 🔧 Résolution de problèmes

### Le workflow échoue ?

1. Vérifiez dans **Settings** > **Actions** > **General**
2. Assurez-vous que "Allow all actions" est coché
3. Dans **Workflow permissions**, sélectionnez "Read and write permissions"

### Le site ne s'affiche pas ?

1. Attendez 2-3 minutes après le premier déploiement
2. Videz le cache de votre navigateur (Ctrl+Shift+R)
3. Vérifiez l'URL dans Settings > Pages

### Erreur 404 sur les pages ?

Si vous avez une erreur sur les liens :
- Vérifiez que tous les chemins dans les HTML sont corrects
- Pour un repo nommé `portfolio`, les liens doivent être relatifs (`pages/education.html`)

---

## 📊 Badges (optionnel)

Ajoutez un badge de statut du déploiement dans votre README :

```markdown
![Deploy Status](https://github.com/<username>/<repo>/actions/workflows/deploy.yml/badge.svg)
```

---

## 🎉 C'est tout !

Votre site est maintenant en ligne avec un déploiement automatique !

Chaque fois que vous poussez sur `main`, GitHub Actions :
1. ✅ Vérifie votre code
2. ✅ Build votre site
3. ✅ Le déploie automatiquement
4. ✅ Votre site est mis à jour !
