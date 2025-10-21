#!/bin/bash
# fix-coc.sh - Reparar configuración de CoC.nvim

echo "🔧 Reparando CoC.nvim..."
echo "========================"

# Verificar Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js no está instalado"
    echo "💡 Instala Node.js: sudo apt install nodejs npm"
    exit 1
fi

echo "✅ Node.js: $(node --version)"
echo "✅ NPM: $(npm --version)"

# Navegar al directorio de CoC.nvim
COC_DIR="$HOME/.local/share/nvim/plugged/coc.nvim"

if [ ! -d "$COC_DIR" ]; then
    echo "❌ CoC.nvim no encontrado"
    echo "💡 Ejecuta: nvim +PlugInstall"
    exit 1
fi

cd "$COC_DIR"

echo "🔄 Limpiando instalación anterior..."
rm -rf node_modules package-lock.json

echo "🔄 Reinstalando dependencias..."
npm install

echo "🔄 Instalando reflect-metadata..."
npm install reflect-metadata

echo "🔄 Instalando typescript (requerido)..."
npm install typescript

# Verificar que las dependencias están correctas
echo ""
echo "📦 Dependencias instaladas:"
if [ -f "package.json" ]; then
    echo "   - $(grep '"name"' package.json | cut -d'"' -f4)"
    if [ -d "node_modules/reflect-metadata" ]; then
        echo "   ✅ reflect-metadata"
    else
        echo "   ❌ reflect-metadata (faltante)"
    fi
    
    if [ -d "node_modules/typescript" ]; then
        echo "   ✅ typescript"
    else
        echo "   ❌ typescript (faltante)"
    fi
fi

# Limpiar configuración de CoC
echo "🔄 Limpiando configuración de CoC..."
rm -rf ~/.config/coc

echo "🔄 Instalando extensiones esenciales de CoC..."
nvim --headless +"CocInstall -sync coc-pyright coc-tsserver coc-json coc-html coc-css" +qa

echo ""
echo "✅ Reparación completada!"
echo ""
echo "💡 Para probar:"
echo "   nvim archivo.py"
echo ""
echo "💡 Si persisten errores, ejecuta:"
echo "   nvim +checkhealth"
