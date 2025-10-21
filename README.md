# 🚀 Configuración de Neovim con vim-plug

Una configuración modular y completa de Neovim optimizada para desarrollo.

## 📁 Estructura de Archivos

```
~/.config/nvim/
├── init.vim              # Archivo principal que carga todos los módulos
├── basic-config.vim      # Configuraciones básicas de Neovim
├── plugins.vim           # Gestión de plugins con vim-plug
├── plugin-config.vim     # Configuración específica de plugins
├── maps.vim              # Mapeos de teclas personalizados
├── coc-settings.json     # Configuración de CoC.nvim
├── install.sh            # Script de instalación automática
└── README.md             # Esta documentación
```

## ⚡ Instalación Rápida

```bash
# Ejecutar el script de instalación
cd ~/.config/nvim
./install.sh
```

## 🔌 Plugins Incluidos

### **Apariencia**
- `paulo-granthon/hyper.nvim` - Tema hyper (con fallback)
- `vim-airline/vim-airline` - Barra de estado mejorada
- `vim-airline/vim-airline-themes` - Temas para airline
- `ryanoasis/vim-devicons` - Iconos para archivos

### **Navegación**
- `preservim/nerdtree` - Explorador de archivos
- `junegunn/fzf` + `junegunn/fzf.vim` - Búsqueda fuzzy
- `easymotion/vim-easymotion` - Movimientos rápidos
- `preservim/tagbar` - Navegador de tags

### **Edición**
- `tpope/vim-commentary` - Comentarios rápidos
- `tpope/vim-surround` - Manipular delimitadores
- `jiangmiao/auto-pairs` - Auto-completado de pares
- `luochen1990/rainbow` - Brackets coloridos

### **Git**
- `tpope/vim-fugitive` - Integración completa con Git
- `airblade/vim-gitgutter` - Mostrar cambios de Git

### **LSP y Autocompletado**
- `neoclide/coc.nvim` - LSP y autocompletado inteligente
- `dense-analysis/ale` - Linting asíncrono

### **Utilidades**
- `mbbill/undotree` - Historial visual de cambios
- `vimwiki/vimwiki` - Wiki personal
- `nvim-treesitter/nvim-treesitter` - Syntax highlighting mejorado
- `yetone/avante.nvim` - Asistente AI (requiere Node.js)

## ⌨️ Atajos de Teclado

### **Leader Key: `<Space>`**

### **Básicos**
| Atajo | Acción |
|-------|--------|
| `<Space>w` | Guardar archivo |
| `<Space>q` | Salir sin guardar |
| `<Space>wq` | Guardar y salir |
| `<Space>r` | Recargar configuración |

### **Navegación entre ventanas**
| Atajo | Acción |
|-------|--------|
| `Ctrl+h/j/k/l` | Moverse entre ventanas |
| `Ctrl+←/→/↑/↓` | Redimensionar ventanas |

### **Buffers**
| Atajo | Acción |
|-------|--------|
| `<Space>bn` | Buffer siguiente |
| `<Space>bp` | Buffer anterior |
| `<Space>bd` | Cerrar buffer |

### **Plugins**

#### **NERDTree**
| Atajo | Acción |
|-------|--------|
| `F3` o `<Space>e` | Toggle NERDTree |
| `<Space>f` | Encontrar archivo actual en NERDTree |

#### **FZF**
| Atajo | Acción |
|-------|--------|
| `Ctrl+p` o `<Space>ff` | Buscar archivos |
| `<Space>fg` | Buscar archivos Git |
| `<Space>fb` | Buscar buffers |
| `<Space>fl` | Buscar líneas |

#### **Git**
| Atajo | Acción |
|-------|--------|
| `<Space>ga` | Git add . |
| `<Space>gc` | Git commit |
| `<Space>gst` | Git status |
| `<Space>gsh` | Git push |
| `<Space>gll` | Git pull |
| `<Space>gn/gp` | Siguiente/Anterior hunk |

#### **CoC.nvim (LSP)**
| Atajo | Acción |
|-------|--------|
| `gd` | Ir a definición |
| `gr` | Ver referencias |
| `K` | Mostrar documentación |
| `<Space>rn` | Renombrar símbolo |
| `[g` / `]g` | Navegar diagnósticos |

#### **EasyMotion**
| Atajo | Acción |
|-------|--------|
| `<Space><Space>w` | Saltar a palabra |
| `<Space><Space>f` | Saltar a caracter |
| `<Space><Space>j/k` | Saltar por líneas |

### **Utilidades**
| Atajo | Acción |
|-------|--------|
| `F5` | Toggle UndoTree |
| `F8` | Toggle Tagbar |
| `<Space>te` | Abrir terminal |
|| `<Space><Space>` | Limpiar búsqueda |

### **Python & Entornos Virtuales**
| Atajo | Acción |
|-------|--------|
| `<Space>py` | Ejecutar Python |
| `<Space>pv` | Ejecutar Python con entorno virtual |
| `<Space>ds` | Django runserver |
| `<Space>dm` | Django makemigrations |
| `<Space>dmi` | Django migrate |
| `<Space>va` | Activar entorno virtual myenv |
| `<Space>vc` | Activar entorno virtual personalizado |
| `<Space>vw` | Mostrar entorno virtual activo |
| `<Space>pi` | Instalar paquete Python |

### **Layout de Desarrollo (Como en la imagen)**
| Atajo | Acción |
|-------|--------|
| `<Space>dl` | Crear layout completo (Editor + 2 terminales) |
| `<Space>t1` | Ir a terminal inferior |
| `<Space>t2` | Ir a terminal lateral |
| `<Space>dr` | Django runserver en terminal inferior |
| `<Space>dt` | Ejecutar tests en terminal lateral |
| `<Space>r1` | Ejecutar comando personalizado en terminal 1 |
| `<Space>r2` | Ejecutar comando personalizado en terminal 2 |
| `Alt+1` | Ventana principal de código |
| `Alt+2` | Terminal lateral |
| `Alt+3` | Terminal inferior |

## 🐍 Entornos Virtuales de Python

### **Detección Automática**
Neovim detecta automáticamente entornos virtuales en:
- `./myenv/` - Tu entorno preferido
- `./venv/`, `./env/`, `./.venv/`
- Variable de entorno `$VIRTUAL_ENV`

### **Características**
- **Auto-detección** al abrir archivos Python
- **Statusline** muestra el entorno activo
- **CoC integration** usa el Python del entorno
- **Linting** con las librerías del entorno

### **Crear proyecto de ejemplo**
```bash
# Crear proyecto de ejemplo con entorno virtual
cd ~/.config/nvim
./create-venv-example.sh
```

### **Uso típico**
1. Crear entorno: `python3 -m venv myenv`
2. Activar en terminal: `source myenv/bin/activate`
3. Abrir Neovim: `nvim archivo.py`
4. Activar en Neovim: `<Space>va`

## 🛠️ Configuraciones Destacadas

### **Interfaz**
- Números de línea relativos
- Línea guía en columna 80
- Resaltado de línea actual
- Soporte para true color

### **Edición**
- Espacios en lugar de tabs (4 espacios)
- Auto-indentación inteligente
- Eliminar espacios al final automáticamente
- Historial de deshacer persistente

### **Búsqueda**
- Búsqueda incremental e inteligente
- Ignora mayúsculas a menos que se especifique
- Resaltado de resultados

## 🔧 Personalización

### **Cambiar tema**
Edita `plugin-config.vim`:
```vim
colorscheme tu_tema_preferido
```

### **Modificar atajos**
Edita `maps.vim` para personalizar los mapeos de teclas.

### **Agregar plugins**
1. Agrega el plugin en `plugins.vim`
2. Configúralo en `plugin-config.vim`
3. Ejecuta `:PlugInstall` en Neovim

## 📦 Dependencias Opcionales

### **Para funcionalidad completa:**
```bash
# Node.js (para CoC y Avante)
sudo apt install nodejs npm

# Python (para algunos plugins)
sudo apt install python3 python3-pip

# FZF (búsqueda fuzzy)
sudo apt install fzf

# Ripgrep (búsqueda más rápida)
sudo apt install ripgrep

# Language servers para CoC
:CocInstall coc-python coc-tsserver coc-html coc-css coc-json
```

## 🚀 Comandos Útiles

### **vim-plug**
```vim
:PlugInstall    " Instalar plugins
:PlugUpdate     " Actualizar plugins
:PlugClean      " Limpiar plugins no utilizados
:PlugStatus     " Ver estado de plugins
```

### **CoC.nvim**
```vim
:CocInstall <extension>   " Instalar extensión
:CocList extensions       " Ver extensiones
:CocRestart              " Reiniciar CoC
:CocConfig               " Editar configuración
```

## 🩺 Verificación de Salud

### **Verificación Rápida**
Ejecuta el script de verificación incluido:

```bash
# Verificar estado general de Neovim
~/.config/nvim/health-check.sh
```

### **Verificación Completa de Neovim**
```bash
# Verificación completa de salud
nvim +checkhealth

# Solo verificar problemas de deprecación
nvim +"checkhealth vim.deprecated"
```

## 🐛 Solución de Problemas

### **Advertencias de Deprecación**
Si ves advertencias sobre `client.notify` o `client.request`, es probable que tengas ALE y CoC.nvim corriendo simultáneamente:

```bash
# Deshabilitar ALE (recomendado si usas CoC.nvim)
nvim ~/.config/nvim/plugins.vim
# Comentar la línea: Plug 'dense-analysis/ale'

# Limpiar plugins no utilizados
nvim +PlugClean!
```

### **Error 'Reflect.hasOwnMetadata is not a function'**
Este error indica que faltan dependencias de Node.js para CoC.nvim:

```bash
# Reparar CoC.nvim automáticamente
~/.config/nvim/fix-coc.sh

# O manualmente:
cd ~/.local/share/nvim/plugged/coc.nvim
npm install reflect-metadata typescript
```

### **Reinstalar Extensiones de CoC**
Si hay problemas con Python LSP:

```bash
# Reinstalar extensiones Python para CoC
nvim +"CocInstall coc-pyright coc-python"
```

### **Tema no carga**
Si el tema `hyper` no está disponible, la configuración usará el tema por defecto.

### **CoC no funciona**
Verifica que Node.js esté instalado:
```bash
node --version
npm --version
```

### **FZF no funciona**
Instala fzf:
```bash
sudo apt install fzf
```

### **Iconos no se muestran**
Instala una fuente con iconos como Nerd Fonts.

## 💻 Layout de Desarrollo (Como tu imagen)

### **¿Qué es el Layout de Desarrollo?**
Una configuración que simula tu flujo de trabajo con múltiples tabs en Warp Terminal:
- **Ventana principal**: Editor de código (como tu tab principal)
- **Terminal inferior**: Para Django runserver (como tu tab pequeño inferior)
- **Terminal lateral**: Para tests y comandos (como tu tab pequeño lateral)

### **Crear el Layout**
```bash
# Demostración completa
~/.config/nvim/demo-layout.sh

# O manualmente en Neovim:
# 1. Abrir archivo: nvim app.py
# 2. Crear layout: <Space>dl
```

### **Flujo de Trabajo Típico**

1. **Inicio del proyecto**:
   ```bash
   cd mi-proyecto-django
   nvim manage.py
   ```

2. **Configurar layout** (`<Space>dl`):
   - Se crean automáticamente 3 ventanas
   - Terminales configurados sin números de línea
   - Navegación optimizada entre ventanas

3. **Activar entorno virtual** (`<Space>dva`):
   - Activa el entorno en ambos terminales
   - Mantiene consistencia en todo el proyecto

4. **Desarrollo activo**:
   - `<Space>dr` → Django runserver (terminal inferior)
   - `<Space>dt` → Ejecutar tests (terminal lateral)
   - `Alt+1/2/3` → Cambiar rápido entre ventanas

### **Ventajas del Layout Integrado**
- ✅ **Un solo Neovim** en lugar de múltiples tabs
- ✅ **Terminales persistentes** que no se cierran
- ✅ **Comandos especializados** para cada terminal
- ✅ **Navegación ultra-rápida** con Alt+números
- ✅ **Entorno virtual sincronizado**
- ✅ **Estado compartido** entre editor y terminales

### **Personalización del Layout**
Puedes modificar las funciones en `plugin-config.vim` para:
- Cambiar el tamaño de los terminales
- Agregar más terminales especializados
- Personalizar los comandos por defecto
- Ajustar la navegación entre ventanas

## 🤝 Contribuir

1. Haz un fork del proyecto
2. Crea una rama para tu feature
3. Haz commit de tus cambios
4. Push a la rama
5. Abre un Pull Request

## 📄 Licencia

Esta configuración está bajo la licencia MIT. Siéntete libre de usarla y modificarla.

---

**¡Disfruta programando con Neovim! 🎉**
