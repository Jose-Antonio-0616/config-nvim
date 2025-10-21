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
sudo apt update

# ============ Python Development ============
print_info "Instalando herramientas de Python..."
sudo apt install -y python3 python3-pip python3-venv python3-dev

# Instalar herramientas de Python
pip3 install --user black isort flake8 pylint autopep8
print_success "Herramientas de Python instaladas"

# ============ Node.js y JavaScript ============
print_info "Instalando Node.js y herramientas JavaScript..."
# Verificar si Node.js ya está instalado
if ! command -v node &> /dev/null; then
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt install -y nodejs
fi

# Instalar herramientas globales de Node.js
sudo npm install -g typescript @typescript-eslint/parser @typescript-eslint/eslint-plugin
sudo npm install -g eslint prettier @tailwindcss/language-server
print_success "Node.js y herramientas JavaScript instaladas"

# ============ PHP Development ============
print_info "Instalando herramientas de PHP..."
sudo apt install -y php php-cli php-mbstring php-xml php-pgsql php-mysql composer

# Instalar Intelephense para PHP
sudo npm install -g intelephense
print_success "Herramientas de PHP instaladas"

# ============ C++ Development ============
print_info "Instalando herramientas de C++..."
sudo apt install -y build-essential clang clang-format cmake gdb

# Instalar ccls para C++
sudo apt install -y ccls
print_success "Herramientas de C++ instaladas"

# ============ Database Tools ============
print_info "Instalando herramientas de base de datos..."
sudo apt install -y postgresql-client

# Instalar SQL Language Server
sudo npm install -g sql-language-server
print_success "Herramientas de base de datos instaladas"

# ============ General Development Tools ============
print_info "Instalando herramientas generales..."
sudo apt install -y curl wget git fzf ripgrep fd-find tree jq
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
npm install coc-python coc-tsserver coc-html coc-css coc-json coc-eslint coc-prettier coc-tailwindcss3
print_success "Extensiones de CoC instaladas"

# Regresar al directorio original
cd - > /dev/null

print_info ""
print_success "¡Instalación de herramientas completada!"
print_info ""
print_info "📋 Herramientas instaladas:"
print_info "  🐍 Python: black, isort, flake8, pylint"
print_info "  🟨 JavaScript: typescript, eslint, prettier"
print_info "  🐘 PHP: composer, intelephense"
print_info "  ⚡ C++: clang, clang-format, ccls"
print_info "  🗄️  Database: postgresql-client, sql-language-server"
print_info "  🔧 CoC: python, tsserver, html, css, json, eslint, prettier, tailwindcss"
print_info ""
print_info "🚀 Comandos útiles después de la instalación:"
print_info "  :CocList extensions    - Ver extensiones instaladas"
print_info "  :CocRestart           - Reiniciar CoC si hay problemas"
print_info "  :checkhealth          - Verificar salud de Neovim"
print_info ""
print_warning "Nota: Reinicia Neovim para que todos los cambios tomen efecto."

echo ""
print_success "¡Tu entorno de desarrollo está listo! 🎊"
