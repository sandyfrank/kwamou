#!/bin/bash

# Script de synchronisation avec GitHub
# Gère la divergence entre local et remote

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}🔄 Synchronisation avec GitHub...${NC}\n"

# Vérifier si le remote existe
if ! git remote | grep -q origin; then
    echo -e "${RED}❌ Remote 'origin' non configuré${NC}"
    echo -e "${YELLOW}📝 Configuration du remote...${NC}"
    echo -e "${YELLOW}Entrez l'URL de votre repo GitHub :${NC}"
    echo -e "${YELLOW}Format : https://github.com/USERNAME/kwamou.git${NC}"
    read -p "URL: " REPO_URL
    git remote add origin "$REPO_URL"
    echo -e "${GREEN}✅ Remote configuré${NC}\n"
fi

# Afficher le remote
echo -e "${BLUE}📍 Remote configuré :${NC}"
git remote -v
echo ""

# Récupérer les informations du remote
echo -e "${BLUE}📥 Récupération des informations du dépôt distant...${NC}"
if git fetch origin 2>/dev/null; then
    echo -e "${GREEN}✅ Fetch réussi${NC}\n"
else
    echo -e "${RED}❌ Erreur lors du fetch${NC}"
    echo -e "${YELLOW}Vérifiez que :${NC}"
    echo -e "  1. L'URL du repo est correcte"
    echo -e "  2. Le repo existe sur GitHub"
    echo -e "  3. Vous avez les permissions d'accès"
    echo -e "\n${YELLOW}Pour corriger l'URL :${NC}"
    echo -e "  git remote set-url origin <nouvelle-url>"
    exit 1
fi

# Vérifier s'il y a des différences
BRANCH=$(git branch --show-current)
echo -e "${BLUE}🌿 Branche actuelle : ${BRANCH}${NC}"

if git rev-parse "origin/${BRANCH}" >/dev/null 2>&1; then
    echo -e "${YELLOW}⚠️  La branche existe sur le remote${NC}"
    echo -e "\n${BLUE}📊 Comparaison avec le remote...${NC}"
    
    # Compter les commits différents
    BEHIND=$(git rev-list --count HEAD..origin/${BRANCH})
    AHEAD=$(git rev-list --count origin/${BRANCH}..HEAD)
    
    echo -e "${YELLOW}Commits en retard : ${BEHIND}${NC}"
    echo -e "${YELLOW}Commits en avance : ${AHEAD}${NC}"
    
    if [ "$BEHIND" -gt 0 ] || [ "$AHEAD" -gt 0 ]; then
        echo -e "\n${YELLOW}⚠️  DIVERGENCE DÉTECTÉE !${NC}"
        echo -e "\n${BLUE}Options disponibles :${NC}"
        echo -e "  ${GREEN}1)${NC} Forcer le push (ÉCRASE le remote avec votre version locale)"
        echo -e "     ${YELLOW}git push -f origin ${BRANCH}${NC}"
        echo -e "\n  ${GREEN}2)${NC} Pull avec rebase (intègre les changements distants)"
        echo -e "     ${YELLOW}git pull --rebase origin ${BRANCH}${NC}"
        echo -e "\n  ${GREEN}3)${NC} Pull avec merge (fusionne les changements)"
        echo -e "     ${YELLOW}git pull origin ${BRANCH}${NC}"
        echo -e "\n  ${GREEN}4)${NC} Créer une nouvelle branche pour vos changements"
        echo -e "     ${YELLOW}git checkout -b restructure${NC}"
        echo -e "\n${RED}⚠️  ATTENTION : L'option 1 supprimera l'historique distant !${NC}"
        echo -e "${YELLOW}Utilisez-la UNIQUEMENT si vous voulez remplacer complètement le contenu distant.${NC}"
    else
        echo -e "${GREEN}✅ Pas de divergence${NC}"
    fi
else
    echo -e "${YELLOW}ℹ️  La branche n'existe pas encore sur le remote${NC}"
    echo -e "${GREEN}Vous pouvez push directement :${NC}"
    echo -e "  ${YELLOW}git push -u origin ${BRANCH}${NC}"
fi

echo -e "\n${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}✅ Analyse terminée${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
