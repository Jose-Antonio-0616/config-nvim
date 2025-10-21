#!/bin/bash

# =====================================================
# Script para crear un entorno virtual de ejemplo
# =====================================================

echo "🐍 Creando entorno virtual de ejemplo..."

# Colores para output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

# Crear directorio de ejemplo
EXAMPLE_DIR="$HOME/python-example"
mkdir -p "$EXAMPLE_DIR"
cd "$EXAMPLE_DIR"

print_info "Creando proyecto de ejemplo en: $EXAMPLE_DIR"

# Crear entorno virtual
if command -v python3 &> /dev/null; then
    print_info "Creando entorno virtual 'myenv'..."
    python3 -m venv myenv
    print_success "Entorno virtual 'myenv' creado"
else
    print_warning "Python3 no encontrado. Instala Python3 primero."
    exit 1
fi

# Activar entorno virtual
print_info "Activando entorno virtual..."
source myenv/bin/activate

# Instalar paquetes básicos
print_info "Instalando paquetes básicos..."
pip install --upgrade pip
pip install django flask requests pandas numpy black isort flake8 pylint

print_success "Paquetes instalados:"
pip list --format=columns

# Crear archivo de ejemplo
print_info "Creando archivos de ejemplo..."

# requirements.txt
cat > requirements.txt << 'EOF'
django>=4.2.0
flask>=2.3.0
requests>=2.31.0
pandas>=2.0.0
numpy>=1.24.0
black>=23.0.0
isort>=5.12.0
flake8>=6.0.0
pylint>=2.17.0
EOF

# app.py de ejemplo
cat > app.py << 'EOF'
#!/usr/bin/env python3
"""
Aplicación de ejemplo para demostrar el entorno virtual
"""

import sys
import os
from datetime import datetime

def main():
    """Función principal"""
    print(f"🐍 Python version: {sys.version}")
    print(f"📁 Current directory: {os.getcwd()}")
    print(f"🕐 Current time: {datetime.now()}")
    
    # Verificar si estamos en un entorno virtual
    if hasattr(sys, 'prefix') and hasattr(sys, 'real_prefix'):
        print("✅ Running in virtual environment (virtualenv)")
    elif hasattr(sys, 'prefix') and hasattr(sys, 'base_prefix') and sys.base_prefix != sys.prefix:
        print("✅ Running in virtual environment (venv)")
    else:
        print("❌ Not running in virtual environment")
    
    # Mostrar path de Python
    print(f"🔍 Python executable: {sys.executable}")
    
    try:
        import requests
        print("✅ requests library is available")
    except ImportError:
        print("❌ requests library not found")
    
    try:
        import pandas
        print("✅ pandas library is available")
    except ImportError:
        print("❌ pandas library not found")

if __name__ == "__main__":
    main()
EOF

# manage.py básico para Django
cat > manage.py << 'EOF'
#!/usr/bin/env python3
import os
import sys

if __name__ == '__main__':
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'settings')
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

# .env de ejemplo
cat > .env << 'EOF'
# Configuraciones de entorno
DEBUG=True
SECRET_KEY=your-secret-key-here
DATABASE_URL=postgresql://user:password@localhost:5432/dbname
EOF

# .gitignore
cat > .gitignore << 'EOF'
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

# C extensions
*.so

# Distribution / packaging
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST

# PyInstaller
*.manifest
*.spec

# Installer logs
pip-log.txt
pip-delete-this-directory.txt

# Unit test / coverage reports
htmlcov/
.tox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
.hypothesis/
.pytest_cache/

# Translations
*.mo
*.pot

# Django stuff:
*.log
local_settings.py
db.sqlite3

# Flask stuff:
instance/
.webassets-cache

# Scrapy stuff:
.scrapy

# Sphinx documentation
docs/_build/

# PyBuilder
target/

# Jupyter Notebook
.ipynb_checkpoints

# pyenv
.python-version

# celery beat schedule file
celerybeat-schedule

# SageMath parsed files
*.sage.py

# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/
myenv/

# Spyder project settings
.spyderproject
.spyproject

# Rope project settings
.ropeproject

# mkdocs documentation
/site

# mypy
.mypy_cache/
EOF

chmod +x app.py manage.py

print_info ""
print_success "¡Proyecto de ejemplo creado exitosamente!"
print_info ""
print_info "📁 Ubicación: $EXAMPLE_DIR"
print_info "🐍 Entorno virtual: myenv"
print_info ""
print_info "Para usar este proyecto:"
print_info "  1. cd $EXAMPLE_DIR"
print_info "  2. source myenv/bin/activate"
print_info "  3. nvim app.py"
print_info ""
print_info "En Neovim, usa los siguientes comandos:"
print_info "  <Space>va    - Activar entorno virtual myenv"
print_info "  <Space>vw    - Mostrar entorno virtual activo"
print_info "  <Space>pv    - Ejecutar Python con entorno virtual"
print_info "  <Space>py    - Ejecutar Python normal"
print_info ""

# Desactivar entorno virtual
deactivate

print_success "¡Listo para usar con Neovim! 🎊"
