#!/bin/bash
# health-check.sh - Verificar estado de salud de Neovim

echo "🩺 Verificando el estado de salud de Neovim..."
echo "============================================="

# Verificar si Neovim está instalado
if ! command -v nvim &> /dev/null; then
    echo "❌ Neovim no está instalado"
    exit 1
fi

echo "✅ Neovim instalado: $(nvim --version | head -1)"

# Verificar plugins instalados
echo ""
echo "🔌 Verificando plugins..."
if [ -d "$HOME/.local/share/nvim/plugged" ]; then
    plugin_count=$(ls -1 ~/.local/share/nvim/plugged | wc -l)
    echo "✅ Plugins instalados: $plugin_count"
    
    # Verificar si ALE está instalado (no debería estar)
    if [ -d "$HOME/.local/share/nvim/plugged/ale" ]; then
        echo "⚠️  ALE está instalado (puede causar conflictos con CoC.nvim)"
        echo "   Ejecuta: nvim --headless +PlugClean! +qa"
    else
        echo "✅ ALE no está instalado (correcto)"
    fi
    
    # Verificar CoC.nvim
    if [ -d "$HOME/.local/share/nvim/plugged/coc.nvim" ]; then
        echo "✅ CoC.nvim instalado"
    else
        echo "❌ CoC.nvim no encontrado"
    fi
else
    echo "❌ Directorio de plugins no encontrado"
fi

# Verificar configuración
echo ""
echo "⚙️  Verificando configuración..."
if [ -f "$HOME/.config/nvim/init.vim" ]; then
    echo "✅ init.vim encontrado"
else
    echo "❌ init.vim no encontrado"
fi

if [ -f "$HOME/.config/nvim/coc-settings.json" ]; then
    echo "✅ coc-settings.json encontrado"
else
    echo "❌ coc-settings.json no encontrado"
fi

# Verificar Python
echo ""
echo "🐍 Verificando Python..."
if command -v python3 &> /dev/null; then
    python_version=$(python3 --version)
    echo "✅ $python_version"
else
    echo "❌ Python3 no encontrado"
fi

# Verificar entorno virtual si existe
if [ ! -z "$VIRTUAL_ENV" ]; then
    echo "✅ Entorno virtual activo: $(basename $VIRTUAL_ENV)"
else
    echo "ℹ️  No hay entorno virtual activo"
fi

# Verificar Warp Terminal
echo ""
echo "🚀 Verificando Warp Terminal..."
if [ "$TERM_PROGRAM" = "WarpTerminal" ] || [ ! -z "$WARP_TERMINAL_SESSION_ID" ]; then
    echo "✅ Ejecutándose en Warp Terminal"
else
    echo "ℹ️  No se detectó Warp Terminal"
fi

# Verificar extensiones de CoC
echo ""
echo "🔧 Verificando extensiones de CoC..."
if [ -f "$HOME/.config/coc/extensions/package.json" ]; then
    echo "✅ Directorio de extensiones CoC encontrado"
    # Mostrar extensiones instaladas
    if command -v jq &> /dev/null; then
        echo "📦 Extensiones instaladas:"
        jq -r '.dependencies | keys[]' ~/.config/coc/extensions/package.json 2>/dev/null | sed 's/^/   - /'
    fi
else
    echo "⚠️  No se encontraron extensiones de CoC instaladas"
fi

# Verificar dependencias de CoC.nvim
echo ""
echo "📦 Verificando dependencias de CoC.nvim..."
COC_DIR="$HOME/.local/share/nvim/plugged/coc.nvim"
if [ -d "$COC_DIR" ]; then
    echo "✅ CoC.nvim directorio encontrado"
    
    # Verificar reflect-metadata
    if [ -d "$COC_DIR/node_modules/reflect-metadata" ]; then
        echo "✅ reflect-metadata instalado"
    else
        echo "❌ reflect-metadata faltante"
        echo "   💡 Ejecuta: ~/.config/nvim/fix-coc.sh"
    fi
    
    # Verificar typescript
    if [ -d "$COC_DIR/node_modules/typescript" ]; then
        echo "✅ typescript instalado"
    else
        echo "⚠️  typescript faltante (recomendado)"
    fi
else
    echo "❌ CoC.nvim no encontrado"
fi

echo ""
echo "🏁 Verificación completa!"
echo ""
echo "💡 Para ejecutar verificación completa de Neovim:"
echo "   nvim --headless +checkhealth +qa"
echo ""
echo "💡 Para verificar solo problemas de deprecación:"
echo "   nvim --headless +checkhealth vim.deprecated +qa"
