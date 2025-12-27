#!/bin/bash

# =====================================================
# Script para instalar herramientas de desarrollo
# =====================================================

echo "🛠️  Instalando herramientas de desarrollo para tu stack..."

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Actualizar sistema
print_info "Actualizando sistema..."
sudo nala update

# ============ Python Development ============
print_info "Instalando herramientas de Python..."
sudo nala install -y python3 python3-pip python3-venv python3-dev

# ============ Node.js y JavaScript ============
print_info "Instalando Node.js y herramientas JavaScript..."
# Verificar si Node.js ya está instalado
if ! command -v node &> /dev/null; then
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo nala install -y nodejs
fi

# Instalar LSPs y formateadores globales de Node.js
sudo npm install -g typescript eslint prettier @tailwindcss/language-server bash-language-server
print_success "Node.js y herramientas JavaScript instaladas"

# ============ Database Tools ============
print_info "Instalando herramientas de base de datos..."
# (psql client es útil para Django, incluso si se usa pgAdmin)
sudo nala install -y postgresql-client
print_success "Herramientas de base de datos instaladas"

# ============ General Development Tools ============
print_info "Instalando herramientas generales..."
# (fzf es dependencia, ripgrep y fd-find son usados por FZF y CoC)
sudo nala install -y curl wget git fzf ripgrep fd-find tree jq clangd
print_success "Herramientas generales instaladas"

# ============ CoC Extensions ============
print_info "Instalando extensiones de CoC..."
# Crear directorio temporal para instalar extensiones
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json ]; then
  echo '{"dependencies":{}}' > package.json
fi

# Instalar extensiones de CoC
npm install coc-html coc-css coc-tailwindcss coc-json coc-tsserver coc-emmet @yaegassy/coc-ruff coc-pyright coc-sh coc-prettier coc-texlab coc-clangd
print_success "Extensiones de CoC instaladas"

# Regresar al directorio original
cd - > /dev/null

print_info ""
print_success "¡Instalación de herramientas completada!"
print_info ""
print_info "📋 Herramientas instaladas:"
print_info "  🟨 JavaScript: typescript, eslint, prettier, @tailwindcss/language-server"
print_info "  🗄️  Database: postgresql-client"
print_info "  🔧 CoC: pyright, ruff, tsserver, html, css, json, tailwindcss, emmet, sh, prettier"
print_info ""
print_info "🚀 Comandos útiles después de la instalación:"
print_info "  :CocList extensions     - Ver extensiones instaladas"
print_info "  :CocRestart           - Reiniciar CoC si hay problemas"
print_info "  :checkhealth          - Verificar salud de Neovim"
print_info ""
print_warning "Nota: Reinicia Neovim para que todos los cambios tomen efecto."

echo ""
print_success "¡Tu entorno de desarrollo está listo! 🎊"
