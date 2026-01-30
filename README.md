# Sandy Frank Kwamou Ngaha - Portfolio Website

Site web personnel présentant mon parcours académique, mes projets de recherche, publications et expériences en Data Science et Génomique Computationnelle.

## 🌐 Site en ligne

Le site est automatiquement déployé sur GitHub Pages via GitHub Actions.

**URL:** `https://<votre-username>.github.io/<nom-du-repo>/`

## 📁 Structure du projet

```
.
├── index.html              # Page d'accueil
├── pages/                  # Pages du site
│   ├── education.html
│   ├── experience.html
│   ├── research.html
│   ├── publications.html
│   ├── software.html
│   ├── awards.html
│   └── teachings.html
├── assets/
│   ├── css/
│   │   └── styles.css     # Styles CSS
│   ├── images/            # Images du site
│   └── js/
│       └── main.js        # JavaScript
├── .github/
│   └── workflows/
│       └── deploy.yml     # Configuration GitHub Actions
└── README.md
```

## 🚀 Déploiement automatique

Le site est automatiquement déployé sur GitHub Pages à chaque push sur la branche `main` ou `master`.

### Étapes pour activer GitHub Pages :

1. **Pousser le code sur GitHub :**
   ```bash
   git add .
   git commit -m "Initial commit"
   git push origin main
   ```

2. **Activer GitHub Pages dans les paramètres du repo :**
   - Allez dans `Settings` > `Pages`
   - Dans **Source**, sélectionnez `GitHub Actions`
   - Le workflow se lancera automatiquement

3. **Vérifier le déploiement :**
   - Allez dans l'onglet `Actions` pour voir le statut du déploiement
   - Une fois terminé, votre site sera disponible à l'URL affichée

### Déploiement manuel

Vous pouvez aussi déclencher un déploiement manuellement :
- Allez dans `Actions` > `Deploy to GitHub Pages`
- Cliquez sur `Run workflow`

## 💻 Développement local

Pour tester le site en local :

```bash
# Avec Python
python3 -m http.server 8000

# Puis ouvrez http://localhost:8000 dans votre navigateur
```

## 🛠️ Technologies utilisées

- **HTML5** - Structure des pages
- **CSS3** - Design moderne avec variables CSS, animations, gradients
- **JavaScript** - Interactions et fonctionnalités dynamiques
- **Google Fonts (Inter)** - Typographie moderne
- **GitHub Actions** - CI/CD automatique
- **GitHub Pages** - Hébergement gratuit

## ✨ Fonctionnalités

- ✅ Design moderne et responsive (mobile, tablette, desktop)
- ✅ Mode multilingue (Français/English)
- ✅ Navigation fluide avec animations
- ✅ Effets de survol élégants
- ✅ Déploiement automatique via CI/CD
- ✅ Optimisé pour la performance et le SEO

## 📝 Mise à jour du contenu

Pour mettre à jour le contenu :

1. Modifiez les fichiers HTML dans `pages/`
2. Committez et poussez les changements
3. Le site sera automatiquement redéployé

```bash
git add .
git commit -m "Update content"
git push origin main
```

## 🎨 Personnalisation

### Modifier les couleurs

Éditez les variables CSS dans `assets/css/styles.css` :

```css
:root {
    --primary-color: #3b82f6;
    --secondary-color: #1e40af;
    --accent-color: #06b6d4;
    /* ... */
}
```

### Modifier la police

Changez la police dans la section `<head>` et le CSS.

## 📧 Contact

- Email: sandy.ngaha@aims-cameroon.org
- Email: kwamouns@univ-grenoble-alpes.fr

## 📄 Licence

© 2026 Sandy Frank Kwamou Ngaha. Tous droits réservés.

