#!/bin/bash
# =====================================================
# test-layout.sh - Script para probar los layouts de Neovim
# =====================================================

echo "🔧 Probando configuración de Neovim con layouts..."
echo ""

# Cambiar al directorio de prueba
cd /home/jose/test-python

echo "📁 Directorio actual: $(pwd)"
echo ""

# Crear archivo de prueba
cat > test_layout_demo.py << 'EOF'
"""
Demo para probar los layouts de Neovim
Este archivo sirve para demostrar el funcionamiento de los layouts
"""

def main():
    """Función principal de demostración"""
    print("¡Hola desde el layout de desarrollo!")
    print("Ventanas disponibles:")
    print("1. Izquierda: Editor principal (este archivo)")
    print("2. Derecha superior: Editor secundario")
    print("3. Derecha inferior izq: Terminal 1")
    print("4. Derecha inferior der: Terminal 2")
    
    # Simular código Django
    from django.shortcuts import render
    
    def mi_vista(request):
        context = {
            'layout': 'funcionando',
            'terminales': 2,
            'editores': 2
        }
        return render(request, 'demo.html', context)

if __name__ == "__main__":
    main()
EOF

echo "✅ Archivo de prueba creado: test_layout_demo.py"
echo ""

echo "🚀 Instrucciones para probar en Neovim:"
echo ""
echo "1. Abrir Neovim: nvim test_layout_demo.py"
echo ""
echo "2. Atajos principales a probar:"
echo "   • <Space>dl  → Crear layout principal (4 ventanas)"
echo "   • <Space>ds  → Crear layout simple"
echo "   • <Space>dd  → Crear layout lateral"
echo "   • <Space>dt  → Crear layout triple"
echo ""
echo "3. Navegación rápida:"
echo "   • Alt+1      → Ventana 1"
echo "   • Alt+2      → Ventana 2"
echo "   • Alt+3      → Ventana 3"
echo "   • Alt+4      → Ventana 4"
echo ""
echo "4. Control de terminales:"
echo "   • <Space>t1  → Ir a Terminal 1"
echo "   • <Space>t2  → Ir a Terminal 2"
echo "   • <Space>r1  → Ejecutar comando en Terminal 1"
echo "   • <Space>r2  → Ejecutar comando en Terminal 2"
echo ""
echo "5. Divisiones personalizadas:"
echo "   • <Space>lh  → División horizontal"
echo "   • <Space>lv  → División vertical"
echo "   • <Space>lt  → Terminal en ventana actual"
echo ""
echo "6. Django/Python específicos:"
echo "   • <Space>dr  → Django runserver"
echo "   • <Space>dx  → Ejecutar tests"
echo ""
echo "7. Mostrar ayuda:"
echo "   • <Space>?   → Menú which-key"
echo ""

echo "🔍 Para probar manualmente:"
echo "nvim test_layout_demo.py"
echo ""

echo "⚡ Comandos de prueba rápida en terminales:"
echo "Terminal 1: echo 'Hola desde Terminal 1'"
echo "Terminal 2: python3 --version"
echo ""
