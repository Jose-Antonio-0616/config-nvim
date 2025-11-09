#!/bin/bash

# =====================================================
# Script de instalación para configuración de Neovim
# =====================================================

echo "🚀 Iniciando instalación de configuración de Neovim..."

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Función para imprimir con colores
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

# Verificar si Neovim está instalado
if ! command -v nvim &> /dev/null; then
    print_error "Neovim no está instalado. Por favor, instálalo primero."
    exit 1
fi

print_success "Neovim encontrado"

# Verificar si curl está disponible
if ! command -v curl &> /dev/null; then
    print_error "curl no está instalado. Por favor, instálalo primero."
    exit 1
fi

# Crear directorios necesarios
print_info "Creando directorios necesarios..."
# CORREGIDO: 'undo' en lugar de 'undodir' y 'vimwiki' eliminado
mkdir -p ~/.local/share/nvim/{site/autoload,plugged,undo}

# Configurar permisos para directorio de undo
# CORREGIDO: 'undo' en lugar de 'undodir'
chmod 700 ~/.local/share/nvim/undo

print_success "Directorios creados"

# Instalar vim-plug automáticamente
print_info "Verificando vim-plug..."
if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
    print_info "Instalando vim-plug..."
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    print_success "vim-plug instalado"
else
    print_success "vim-plug ya está instalado"
fi

# Verificar Node.js para CoC
print_info "Verificando Node.js..."
if command -v node &> /dev/null; then
    NODE_VERSION=$(node -v)
    print_success "Node.js encontrado: $NODE_VERSION"
else
    print_warning "Node.js no encontrado. Algunos plugins (CoC) pueden no funcionar correctamente."
    print_info "  Para instalar Node.js en Linux Mint:"
    print_info "    sudo apt update && sudo apt install nodejs npm"
fi

# Verificar Python para algunos plugins
print_info "Verificando Python..."
if command -v python3 &> /dev/null; then
    PYTHON_VERSION=$(python3 --version)
    print_success "Python3 encontrado: $PYTHON_VERSION"
else
    print_warning "Python3 no encontrado. Algunos plugins pueden requerir Python."
fi

# Verificar git
print_info "Verificando Git..."
if command -v git &> /dev/null; then
    print_success "Git encontrado"
else
    print_warning "Git no encontrado. Los plugins de Git no funcionarán."
fi

# Verificar fzf
print_info "Verificando fzf..."
if command -v fzf &> /dev/null; then
    print_success "fzf encontrado"
else
    print_warning "fzf no encontrado. Para instalarlo:"
    print_info "    sudo apt install fzf"
fi

# Instalar plugins
print_info "Instalando plugins de Neovim..."
nvim --headless +PlugInstall +qall

print_success "Plugins instalados"

# Información adicional
print_info ""
print_info "🎉 ¡Configuración completada!"
print_info ""
print_info "📋 Información importante:"
print_info "  • Leader key: Espacio"
print_info "  • Archivos de configuración en: ~/.config/nvim/"
# CORREGIDO: Eliminado <Space>e
print_info "  • Para abrir NERDTree: F3"
print_info "  • Para búsqueda de archivos: Ctrl+p"
print_info "  • Para ver todos los atajos: ver maps.vim"
print_info ""
print_info "🔧 Comandos útiles:"
print_info "  :PlugInstall   - Instalar plugins"
print_info "  :PlugUpdate    - Actualizar plugins"
print_info "  :PlugClean     - Limpiar plugins no utilizados"
# CORREGIDO: Lista de extensiones de CoC actualizada
print_info "  :CocInstall coc-pyright @yaegassy/coc-ruff coc-tsserver coc-html coc-css coc-json coc-tailwindcss coc-emmet coc-sh"
print_info ""
print_warning "Nota: Algunos plugins pueden requerir configuración adicional o dependencias externas."

echo ""
print_success "¡Disfruta tu nueva configuración de Neovim! 🎊"