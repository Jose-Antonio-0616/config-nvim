# 🚀 Neovim IDE Configuration: Fullstack & Embedded

Una configuración de Neovim **modular y de alto rendimiento**, diseñada para desarrolladores Fullstack (Python/Django, JS/TS) y Sistemas Embebidos (PlatformIO, MicroPython). Incluye un **sistema de Layouts propio**, detección automática de entornos virtuales y una gestión de LSP moderna.

---

## ✨ Características Principales

*   **⚡ Sistema de Layouts Avanzado:** Crea, gestiona y guarda distribuciones de ventanas y terminales interactivamente (`DevLayout`, `CustomLayout`).
*   **🛠️ Desarrollo Embebido Integrado:**
    *   **PlatformIO:** Compila, sube y monitorea directamente desde Neovim.
    *   **MicroPython:** REPL integrado, ejecución remota y gestión de archivos.
*   **🐍 Python Powerhouse:** Detección automática de `venv`, formateo con **Ruff** y soporte para templates de Django.
*   **🌐 Web Moderno:** Soporte para HTML (HTMX), CSS (Tailwind), JS/TS (Alpine.js) con **Emmet** y **Prettier**.
*   **📊 Ciencia de Datos:** Integración con **Quarto** y **Iron.nvim** para ejecución de bloques de código (REPL).
*   **📝 LaTeX Profesional:** Compilación continua, vista previa sincronizada y gestión de errores con **VimTex**.
*   **🎨 UI Profesional:** Tema oscuro optimizado, iconos *Nerd Fonts*, barra de estado inteligente y menú de atajos (`Which-Key`).

---

## 🏗️ Sistema de Layouts

Esta configuración incluye un motor de layouts escrito en VimScript/Lua que te permite definir tu espacio de trabajo.

### 1. Dev Layout (`<Space>dl`)
Un entorno predefinido para desarrollo fullstack:
*   **Izquierda:** Editor de código principal.
*   **Arriba Derecha:** Editor secundario (tests, referencias).
*   **Abajo Derecha:** 2 Terminales independientes.

| Atajo | Descripción |
| :--- | :--- |
| `<Space>dl` | **Crea** el layout de desarrollo. |
| `<Space>la` | **Reajusta** el tamaño de las ventanas. |
| `<Space>t1` / `t2` | Alternar foco en **Terminal 1** o **2**. |
| `<Space>r1` / `r2` | Enviar comando rápido a Terminal 1 o 2. |

### 2. Custom Layout Designer (`<Space>lc`)
Diseña tu propio entorno de forma interactiva paso a paso.

1.  Inicia con `<Space>lc`.
2.  Elige tu siguiente paso:
    *   `<Space>lH` / `<Space>lV`: División Horizontal / Vertical.
    *   `<Space>lT`: Insertar Terminal.
    *   `<Space>le`: Insertar Editor.
3.  Guarda tu obra maestra con `<Space>ls` (se guardan en `~/.config/nvim/layouts/`).
4.  Carga layouts guardados con `<Space>ll`.

---

## 🤖 Desarrollo de Sistemas Embebidos

### Guía de Inicio Rápido

Pasos esenciales para comenzar proyectos embebidos con esta configuración.

#### **PlatformIO**
1.  **Buscar placa:** Encuentra el ID de tu placa de desarrollo.
    ```bash
    pio boards [filtro]  # Ej: pio boards esp32
    ```
2.  **Iniciar Proyecto:** Crea la estructura básica.
    ```bash
    pio project init --board [ID]
    ```

#### **MicroPython (Workflow Moderno con `uv`)**
Esta configuración asume el uso de `uv` para gestionar herramientas y stubs.

1.  **Iniciar Proyecto:**
    ```bash
    uv init [nombre_proyecto]
    cd [nombre_proyecto]
    ```
2.  **Instalar Herramientas (Dev):** Agrega `pynvim` (para integración con Neovim), `ruff` (linter) y `mpremote`.
    ```bash
    uv add --dev pynvim ruff mpremote
    ```
3.  **Agregar Stubs (Autocompletado):** Es vital para que el LSP reconozca los módulos como `machine` o `time`.
    *   **Para ESP32:**
        ```bash
        uv add --dev micropython-esp32-stubs
        ```
    *   **Para Raspberry Pi Pico (RP2040/RP2350):**
        ```bash
        uv add --dev micropython-rp2-stubs
        ```

### Atajos de Embebidos

| Categoría | Atajo | Acción |
| :--- | :--- | :--- |
| **PlatformIO** | `<Space>mb` | **Build:** Compilar proyecto. |
| | `<Space>mu` | **Upload:** Subir firmware. |
| | `<Space>mm` | **Monitor:** Abrir monitor serial. |
| | `<Space>mi` | **InitDB:** Generar `compile_commands.json` (para LSP C++). |
| **MicroPython** | `<Space>ur` | **Run:** Ejecutar script en RAM. |
| | `<Space>uu` | **Upload:** Copiar archivo al dispositivo. |
| | `<Space>up` | **REPL:** Abrir consola interactiva. |
| | `<Space>ul` | **List:** Listar archivos (`ls`). |

---

## 📝 LaTeX (VimTex)

Integración completa para documentos científicos y académicos. Requiere tener instalado una distribución de LaTeX (ej. TeX Live) y un visor de PDF (ej. Zathura).

| Atajo | Descripción |
| :--- | :--- |
| `<Space>xc` | **Compilar:** Inicia/Detiene compilación continua. |
| `<Space>xv` | **Ver PDF:** Abre el visor sincronizado. |
| `<Space>xe` | **Errores:** Muestra panel de errores de compilación. |
| `<Space>xt` | **TOC:** Alternar tabla de contenidos lateral. |
| `<Space>xl` | **Limpiar:** Borra archivos auxiliares (.aux, .log). |

---

## ⌨️ Otros Atajos Clave

La tecla líder es **`Espacio`**. Usa `<Space>?` para ver un menú interactivo con todos los comandos disponibles.

### General & UI
*   `<Space>w` / `q`: Guardar / Salir.
*   `<Space>e`: Buscar archivo en árbol (NERDTree).
*   `<Space><Space>w/f`: Movimiento rápido (EasyMotion).

### Navegación & Búsqueda (FZF)
*   **`Ctrl + p`**: **Búsqueda rápida de archivos** (Quick Open).
*   `<Space>fg`: Archivos rastreados por Git.
*   `<Space>fb`: Listar Buffers abiertos.
*   `<Space>fl`: Buscar texto en las líneas del archivo actual.

### Git
*   `<Space>gst`: Status.
*   `<Space>gc`: Commit.
*   `<Space>gsh` / `gll`: Push / Pull.
*   `<Space>gn` / `gp`: Siguiente / Anterior cambio (Hunk).

### Código & LSP (CoC)
*   `gd`: Ir a definición.
*   `K`: Ver documentación (Hover).
*   `<Space>rn`: Renombrar símbolo.
*   `<Space>f`: Formatear código (Prettier/Ruff).

---

## 📂 Estructura del Proyecto

```text
~/.config/nvim/
├── init.vim              # Núcleo: Carga módulos
├── basic-config.vim      # Sets básicos (indentación, UI)
├── plugins.vim           # Lista de plugins (vim-plug)
├── plugin-config.vim     # Configuración pesada y Layout Engine
├── coc-settings.json     # Configuración LSP (Ruff, Pyright, etc.)
├── maps.vim              # Atajos globales
└── layouts/              # Tus layouts personalizados guardados
```

---

## 🚀 Instalación Automática

Esta configuración incluye scripts para automatizar la puesta a punto de tu entorno.

1.  **Clonar el repositorio:**
    ```bash
    git clone https://github.com/TU_USUARIO/TU_REPO.git ~/.config/nvim
    cd ~/.config/nvim
    ```

2.  **Instalar Dependencias de Desarrollo:**
    Ejecuta este script para instalar los LSPs, formateadores y herramientas del sistema (Python, Node.js, FZF, etc.).
    ```bash
    ./install-dev-tools.sh
    ```

3.  **Instalar Configuración de Neovim:**
    Este script configura los directorios, instala `vim-plug` y todos los plugins automáticamente.
    ```bash
    ./install.sh
    ```

4.  **Verificar:**
    Abre Neovim y ejecuta `:checkhealth` para asegurar que todo esté correcto. Si usas iconos, asegúrate de tener una **Nerd Font** instalada en tu terminal.

---
*Hecho con ❤️ y VimScript.*