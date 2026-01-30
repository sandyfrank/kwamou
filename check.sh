#!/bin/bash

# Script de vérification avant déploiement
# Usage: ./check.sh

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}🔍 Vérification de la configuration du projet...${NC}\n"

# Vérifier la structure des fichiers
echo -e "${BLUE}📁 Vérification de la structure des fichiers...${NC}"

check_file() {
    if [ -f "$1" ]; then
        echo -e "${GREEN}✅ $1${NC}"
        return 0
    else
        echo -e "${RED}❌ $1 (manquant)${NC}"
        return 1
    fi
}

check_dir() {
    if [ -d "$1" ]; then
        echo -e "${GREEN}✅ $1/${NC}"
        return 0
    else
        echo -e "${RED}❌ $1/ (manquant)${NC}"
        return 1
    fi
}

# Fichiers principaux
check_file "index.html"
check_file "README.md"
check_file ".gitignore"
check_file ".github/workflows/deploy.yml"

# Dossiers
check_dir "pages"
check_dir "assets"
check_dir "assets/css"
check_dir "assets/js"
check_dir "assets/images"

# Pages
echo -e "\n${BLUE}📄 Vérification des pages...${NC}"
check_file "pages/education.html"
check_file "pages/experience.html"
check_file "pages/research.html"
check_file "pages/publications.html"
check_file "pages/software.html"
check_file "pages/awards.html"
check_file "pages/Teachings.html"

# Assets
echo -e "\n${BLUE}🎨 Vérification des assets...${NC}"
check_file "assets/css/styles.css"
check_file "assets/js/main.js"

# Vérifier Git
echo -e "\n${BLUE}🔧 Vérification de Git...${NC}"
if git rev-parse --git-dir > /dev/null 2>&1; then
    echo -e "${GREEN}✅ Repository Git initialisé${NC}"
    
    # Vérifier si un remote est configuré
    if git remote -v | grep -q origin; then
        echo -e "${GREEN}✅ Remote 'origin' configuré${NC}"
        git remote -v | head -2
    else
        echo -e "${YELLOW}⚠️  Remote 'origin' non configuré${NC}"
        echo -e "${YELLOW}   Utilisez: git remote add origin <url>${NC}"
    fi
    
    # Vérifier la branche
    BRANCH=$(git branch --show-current)
    echo -e "${GREEN}✅ Branche actuelle: ${BRANCH}${NC}"
    
else
    echo -e "${RED}❌ Git n'est pas initialisé${NC}"
fi

# Vérifier les modifications non committées
echo -e "\n${BLUE}📝 Vérification des modifications...${NC}"
if git diff-index --quiet HEAD -- 2>/dev/null; then
    echo -e "${GREEN}✅ Aucune modification non committée${NC}"
else
    echo -e "${YELLOW}⚠️  Modifications non committées détectées${NC}"
    echo -e "${YELLOW}   Utilisez: ./deploy.sh \"votre message\" pour déployer${NC}"
fi

echo -e "\n${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}✅ Vérification terminée !${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"

echo -e "${BLUE}📚 Prochaines étapes :${NC}"
echo -e "  1️⃣  Créer un repo sur GitHub"
echo -e "  2️⃣  Lier votre repo local : ${YELLOW}git remote add origin <url>${NC}"
echo -e "  3️⃣  Déployer : ${YELLOW}./deploy.sh \"Initial commit\"${NC}"
echo -e "  4️⃣  Activer GitHub Pages dans Settings > Pages"
echo -e "\n${BLUE}📖 Voir DEPLOYMENT.md pour plus de détails${NC}\n"
