#!/bin/bash

# Script de déploiement rapide
# Usage: ./deploy.sh "Message de commit" [--force]

set -e

# Couleurs pour les messages
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Démarrage du déploiement...${NC}"

# Vérifier si un message de commit est fourni
if [ -z "$1" ]; then
    echo -e "${RED}❌ Erreur: Veuillez fournir un message de commit${NC}"
    echo "Usage: ./deploy.sh \"Votre message de commit\" [--force]"
    exit 1
fi

COMMIT_MESSAGE="$1"
FORCE_PUSH=""

# Vérifier si --force est passé
if [ "$2" = "--force" ] || [ "$2" = "-f" ]; then
    FORCE_PUSH="-f"
    echo -e "${YELLOW}⚠️  Mode force activé - écrasera le remote${NC}"
fi

# Vérifier si le remote est configuré
if ! git remote | grep -q origin; then
    echo -e "${YELLOW}⚠️  Remote non configuré${NC}"
    echo -e "${BLUE}Entrez l'URL de votre repo GitHub (ex: https://github.com/username/kwamou.git) :${NC}"
    read -p "URL: " REPO_URL
    git remote add origin "$REPO_URL"
    echo -e "${GREEN}✅ Remote configuré${NC}"
fi

# Afficher le remote
echo -e "${BLUE}📍 Remote: $(git remote get-url origin)${NC}"

# Vérifier les modifications
echo -e "${BLUE}📝 Vérification des modifications...${NC}"
git status --short

# Ajouter tous les fichiers
echo -e "${BLUE}➕ Ajout des fichiers...${NC}"
git add .

# Commit
echo -e "${BLUE}💾 Commit des modifications...${NC}"
git commit -m "$COMMIT_MESSAGE" || echo "Rien à commiter"

# Push
echo -e "${BLUE}⬆️  Push vers GitHub...${NC}"
if [ -n "$FORCE_PUSH" ]; then
    git push $FORCE_PUSH origin main
else
    git push origin main || {
        echo -e "${YELLOW}⚠️  Push échoué - divergence possible${NC}"
        echo -e "${YELLOW}Options:${NC}"
        echo -e "  1. Force push (écrase le remote): ${BLUE}./deploy.sh \"$COMMIT_MESSAGE\" --force${NC}"
        echo -e "  2. Pull d'abord: ${BLUE}git pull origin main${NC}"
        echo -e "  3. Voir le guide: ${BLUE}cat SYNC_GUIDE.md${NC}"
        exit 1
    }
fi

echo -e "${GREEN}✅ Déploiement terminé !${NC}"
echo -e "${GREEN}🌐 GitHub Actions va maintenant déployer votre site automatiquement.${NC}"
echo -e "${GREEN}📊 Vérifiez l'avancement dans l'onglet Actions de votre repo GitHub.${NC}"
echo -e "${GREEN}🔗 Votre site sera disponible à: https://USERNAME.github.io/kwamou/${NC}"
