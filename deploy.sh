#!/bin/bash

# Script de déploiement rapide
# Usage: ./deploy.sh "Message de commit"

set -e

# Couleurs pour les messages
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Démarrage du déploiement...${NC}"

# Vérifier si un message de commit est fourni
if [ -z "$1" ]; then
    echo -e "${RED}❌ Erreur: Veuillez fournir un message de commit${NC}"
    echo "Usage: ./deploy.sh \"Votre message de commit\""
    exit 1
fi

COMMIT_MESSAGE="$1"

# Vérifier les modifications
echo -e "${BLUE}📝 Vérification des modifications...${NC}"
git status

# Ajouter tous les fichiers
echo -e "${BLUE}➕ Ajout des fichiers...${NC}"
git add .

# Commit
echo -e "${BLUE}💾 Commit des modifications...${NC}"
git commit -m "$COMMIT_MESSAGE"

# Push
echo -e "${BLUE}⬆️  Push vers GitHub...${NC}"
git push origin main

echo -e "${GREEN}✅ Déploiement terminé !${NC}"
echo -e "${GREEN}🌐 GitHub Actions va maintenant déployer votre site automatiquement.${NC}"
echo -e "${GREEN}📊 Vérifiez l'avancement dans l'onglet Actions de votre repo GitHub.${NC}"
