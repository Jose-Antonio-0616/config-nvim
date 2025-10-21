#!/bin/bash
# demo-layout.sh - Demostración del layout de desarrollo de Neovim

echo "🚀 Creando proyecto de demostración del layout de desarrollo"
echo "=========================================================="

# Crear directorio de proyecto
PROJECT_DIR="$HOME/demo-layout-nvim"
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"

echo "📁 Creando estructura del proyecto Django..."

# Crear archivo de ejemplo de Django
cat > manage.py << 'EOF'
#!/usr/bin/env python
"""Django's command-line utility for administrative tasks."""
import os
import sys

if __name__ == '__main__':
    """Run administrative tasks."""
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'myproject.settings')
    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc
    execute_from_command_line(sys.argv)
EOF

# Crear app.py de ejemplo
cat > app.py << 'EOF'
"""
Ejemplo de aplicación Django para demostrar el layout de desarrollo
"""
from django.http import HttpResponse
from django.views import View

class HomeView(View):
    """Vista principal de la aplicación"""
    
    def get(self, request):
        """Maneja peticiones GET"""
        return HttpResponse("¡Hola desde Django!")
    
    def post(self, request):
        """Maneja peticiones POST"""
        data = request.POST.get('data', 'No data')
        return HttpResponse(f"Datos recibidos: {data}")

# Función de utilidad
def process_data(data_list):
    """Procesa una lista de datos"""
    processed = []
    for item in data_list:
        if isinstance(item, str):
            processed.append(item.upper())
        elif isinstance(item, int):
            processed.append(item * 2)
    return processed

if __name__ == "__main__":
    # Ejemplo de uso
    sample_data = ["hello", "world", 42, "django"]
    result = process_data(sample_data)
    print("Datos procesados:", result)
EOF

# Crear test_app.py
cat > test_app.py << 'EOF'
"""
Tests para la aplicación Django
"""
import unittest
from app import process_data, HomeView

class TestApp(unittest.TestCase):
    """Tests para las funciones de la aplicación"""
    
    def test_process_data_strings(self):
        """Test para procesar strings"""
        data = ["hello", "world"]
        result = process_data(data)
        expected = ["HELLO", "WORLD"]
        self.assertEqual(result, expected)
    
    def test_process_data_integers(self):
        """Test para procesar enteros"""
        data = [5, 10]
        result = process_data(data)
        expected = [10, 20]
        self.assertEqual(result, expected)
    
    def test_process_data_mixed(self):
        """Test para procesar datos mixtos"""
        data = ["test", 3, "python"]
        result = process_data(data)
        expected = ["TEST", 6, "PYTHON"]
        self.assertEqual(result, expected)

if __name__ == '__main__':
    unittest.main()
EOF

# Crear requirements.txt
cat > requirements.txt << 'EOF'
Django>=4.2.0
pytest>=7.0.0
black>=23.0.0
flake8>=6.0.0
EOF

# Crear .gitignore
cat > .gitignore << 'EOF'
__pycache__/
*.pyc
*.pyo
*.pyd
.Python
env/
venv/
.venv/
myenv/
.env
*.sqlite3
.coverage
htmlcov/
.pytest_cache/
node_modules/
EOF

echo "✅ Proyecto creado en: $PROJECT_DIR"
echo ""
echo "🎯 Instrucciones de uso del Layout de Desarrollo:"
echo "================================================="
echo ""
echo "1. Crear entorno virtual:"
echo "   cd $PROJECT_DIR"
echo "   python3 -m venv myenv"
echo "   source myenv/bin/activate"
echo ""
echo "2. Instalar dependencias:"
echo "   pip install -r requirements.txt"
echo ""
echo "3. Abrir Neovim:"
echo "   nvim app.py"
echo ""
echo "4. Configurar layout de desarrollo:"
echo "   - Presionar: <Space>dl (Crear Layout)"
echo "   - Esto creará:"
echo "     * Ventana principal: Editor de código"
echo "     * Terminal inferior: Para Django runserver"  
echo "     * Terminal lateral: Para tests y comandos"
echo ""
echo "5. Atajos útiles del layout:"
echo "   <Space>dl  - Crear layout de desarrollo"
echo "   <Space>t1  - Ir a terminal inferior"
echo "   <Space>t2  - Ir a terminal lateral"
echo "   <Space>dr  - Django runserver (en terminal inferior)"
echo "   <Space>dt  - Ejecutar tests (en terminal lateral)"
echo "   <Alt>1     - Ventana principal (código)"
echo "   <Alt>2     - Terminal lateral" 
echo "   <Alt>3     - Terminal inferior"
echo ""
echo "6. Flujo de trabajo típico:"
echo "   a) <Space>dl           # Crear layout"
echo "   b) <Space>dva myenv    # Activar entorno virtual en terminales"
echo "   c) <Space>dr           # Iniciar Django server"
echo "   d) <Alt>2              # Cambiar a terminal lateral"
echo "   e) <Space>dt           # Ejecutar tests"
echo "   f) <Alt>1              # Volver a editar código"
echo ""
echo "¡Listo para probar el layout de desarrollo! 🎉"
