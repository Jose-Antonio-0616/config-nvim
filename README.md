# 🚀 Configuración de Neovim con vim-plug

Una configuración modular y potente de Neovim optimizada para desarrollo, con un **sistema de layouts dinámicos** como funcionalidad principal.

## 🌟 Funcionalidad Principal: Sistema de Layouts Dinámicos

Esta configuración no solo organiza tu editor, sino que te permite crear, guardar y gestionar complejos arreglos de ventanas y terminales de forma interactiva.

### 1. Layout de Desarrollo Predefinido (`<Space>dl`)
Un layout listo para usar, inspirado en un flujo de trabajo de desarrollo web moderno.
- **Ventana Principal (Izquierda)**: Para tu código principal.
- **Ventana Secundaria (Arriba, Derecha)**: Para archivos relacionados, tests o referencias.
- **Dos Terminales (Abajo)**:
    - **Terminal 1**: Ideal para servidores de desarrollo (`npm start`, `django runserver`).
    - **Terminal 2**: Para tests, comandos de git, etc.

| Atajo | Acción |
|-------|--------|
| `<Space>dl` | Crear el Layout de Desarrollo |
| `<Space>t1` | Alternar/Ir al Terminal 1 |
| `<Space>t2` | Alternar/Ir al Terminal 2 |
| `<Space>r1` | Ejecutar un comando en el Terminal 1 |
| `<Space>r2` | Ejecutar un comando en el Terminal 2 |
| `<Space>la` | Reajustar las proporciones del layout |

### 2. Creador de Layouts Personalizados (`<Space>l...`)
Crea tu propio layout paso a paso de forma interactiva.

**Flujo de trabajo:**
1.  Inicia con `<Space>lc`.
2.  Usa los atajos para añadir divisiones y ventanas.
3.  Guarda tu creación con `<Space>ls` para usarla más tarde.

| Atajo | Acción |
|-------|--------|
| `<Space>lc` | **Iniciar** la creación de un layout |
| `<Space>ln` | Ir al **siguiente paso** |
| `<Space>lH` / `<Space>lV` | Añadir división **Horizontal** / **Vertical** |
| `<Space>lT` | Añadir una **Terminal** |
| `<Space>le` | Añadir un **Editor** |
| `<Space>ld` | **Terminar** la creación |
| `<Space>ls` | **Guardar** el layout actual |
| `<Space>ll` | **Cargar** un layout guardado |
| `<Space>lq` | **Cerrar todas las ventanas** y volver a una sola |
| `<Space>li` | Mostrar **información** del layout actual |

---

## 📁 Estructura de Archivos

```
~/.config/nvim/
├── init.vim              # Archivo principal que carga los módulos
├── basic-config.vim      # Configuraciones básicas de Neovim
├── plugins.vim           # Gestión de plugins con vim-plug
├── plugin-config.vim     # Configuración de plugins y LUA
├── maps.vim              # Mapeos de teclas principales
├── which-key-config.vim  # Configuración del menú de atajos
├── coc-settings.json     # Configuración de CoC.nvim
├── install.sh            # Script de instalación
├── KEYMAPS.md            # Guía completa de atajos (¡Actualizada!)
└── README.md             # Esta documentación
```

## ⚡ Instalación Rápida

```bash
# Clona o copia la configuración en ~/.config/nvim
# Luego ejecuta el script de instalación
cd ~/.config/nvim
./install.sh
```
*El script intentará instalar `vim-plug` y los plugins automáticamente.*

## 🔌 Plugins Incluidos

### **Apariencia**
- `paulo-granthon/hyper.nvim`: Tema principal.
- `vim-airline/vim-airline` + `vim-airline-themes`: Barra de estado mejorada.
- `nvim-tree/nvim-web-devicons`: Iconos para la interfaz.
- `luochen1990/rainbow`: Paréntesis y brackets coloreados.

### **Navegación y Búsqueda**
- `preservim/nerdtree`: Explorador de archivos clásico.
- `junegunn/fzf` + `junegunn/fzf.vim`: Búsqueda "fuzzy" ultra-rápida.
- `easymotion/vim-easymotion`: Movimientos rápidos en pantalla.
- `preservim/tagbar`: Navegador de tags y estructura de código.

### **Edición y Productividad**
- `tpope/vim-commentary`: Comentar y descomentar código fácilmente.
- `tpope/vim-surround`: Manipular "alrededores" (comillas, paréntesis, etc.).
- `jiangmiao/auto-pairs`: Cierre automático de pares (`()`, `[]`, `""`).
- `mattn/emmet-vim`: Expansión de abreviaturas HTML/CSS.

### **Git**
- `tpope/vim-fugitive`: Integración completa con Git.
- `airblade/vim-gitgutter`: Muestra los cambios de Git en el lateral.

### **LSP y Autocompletado**
- `neoclide/coc.nvim`: Framework de autocompletado y LSP.
- `nvim-treesitter/nvim-treesitter`: Resaltado de sintaxis avanzado y preciso.

### **Utilidades**
- `mbbill/undotree`: Visualizador del historial de cambios (árbol de "undo").
- `folke/which-key.nvim`: Menú emergente que muestra los atajos de teclado disponibles.
- `stevearc/dressing.nvim`: Mejora la interfaz de usuario para `vim.ui.input` y `select`.
- `nvim-lua/plenary.nvim` y `MunifTanjim/nui.nvim`: Dependencias para otros plugins.

## ⌨️ Atajos de Teclado Esenciales

> Para una lista completa y actualizada, consulta el archivo **`KEYMAPS.md`**.

| Atajo | Acción |
|-------|--------|
| `<Space>` | **Leader Key**: Inicia la mayoría de los atajos. |
| `<Space>w` | Guardar archivo. |
| `<Space>q` | Salir sin guardar. |
| `<Space>R` | Recargar la configuración de Neovim. |
| `F3` | Alternar el explorador de archivos (NERDTree). |
| `Ctrl+p` | Buscar archivos en el proyecto (FZF). |
| `<Space>f` | Formatear código (CoC). |
| `<Space>g` | Menú de Git (Fugitive). |
| `<Space>l` | Menú del Sistema de Layouts. |
| `<Space>?` | Mostrar menú de atajos (WhichKey). |

## 🐍 Entornos Virtuales de Python

Esta configuración detecta y utiliza automáticamente el intérprete de Python de los entornos virtuales.
- **Detección automática** al abrir archivos `.py`.
- **Indicador en la barra de estado** (Airline) que muestra el entorno activo.
- **Integración con CoC.nvim** para que el autocompletado y el linting usen las librerías del entorno.

**Uso:**
1.  Crea tu entorno (`python -m venv .venv`).
2.  Actívalo en tu shell (`source .venv/bin/activate`).
3.  Abre Neovim. El entorno será detectado y utilizado automáticamente.

## 📦 Dependencias

### **Requeridas**
- **Neovim 0.5+**
- **Git**
- **curl** o **wget** (para instalar vim-plug)

### **Para Funcionalidad Completa**
- **Node.js y npm**: Absolutamente necesario para `coc.nvim`.
- **Python 3 y pip**: Para proveedores de Neovim y algunos LSPs.
- **fzf**: Para la búsqueda fuzzy.
- **ripgrep**: Recomendado para que `fzf` sea más rápido.
- **Una Nerd Font**: Para que los iconos se muestren correctamente.

```bash
# Ejemplo de instalación en Debian/Ubuntu
sudo apt update
sudo apt install nodejs npm python3-pip fzf ripgrep
```

### **Language Servers (LSP)**
Debes instalarlos a través de `coc.nvim` para obtener autocompletado específico del lenguaje.
```vim
" Dentro de Neovim, ejecuta:
:CocInstall coc-pyright coc-tsserver coc-json coc-html coc-css
```

## 🐛 Solución de Problemas

- **Los iconos no se ven bien**: Asegúrate de tener una [Nerd Font](https://www.nerdfonts.com/) instalada y configurada en tu terminal.
- **`coc.nvim` no funciona**: Verifica que Node.js esté instalado (`node --version`). Si da error, entra en el directorio de CoC y reinstala sus dependencias: `cd ~/.local/share/nvim/plugged/coc.nvim && npm install`.
- **FZF no funciona**: Asegúrate de que `fzf` esté instalado y accesible en tu `PATH`.

---

**¡Disfruta programando con Neovim! 🎉**
