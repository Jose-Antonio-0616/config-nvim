# ⌨️ Guía Completa de Atajos de Teclado (Keymaps)

Esta configuración utiliza la tecla **Espacio** (`<Space>`) como **Leader Key**.
Puedes presionar `<Space>?` en cualquier momento para ver un menú interactivo con estos atajos.

---

## 🛠️ General y Gestión de Ventanas

| Atajo | Acción |
| :--- | :--- |
| `<Space>w` | Guardar archivo actual. |
| `<Space>q` | Salir sin guardar (`:q!`). |
| `<Space>wq` | Guardar y salir. |
| `<Space>R` | Recargar toda la configuración de Neovim (`$MYVIMRC`). |
| `<Space>?` | Mostrar menú de ayuda (Which-Key). |
| `<Space>ht` | Cambiar tipo de archivo a HTML manualmente. |
| `<Space>te` | Abrir una terminal en una ventana nueva. |
| `<Space>tn` | Mostrar/Ocultar números de línea. |
| `<Space>tr` | Alternar entre números relativos y absolutos. |

### Movimiento y Redimensionado
| Atajo | Acción |
| :--- | :--- |
| `Ctrl + h/j/k/l` | Moverse entre ventanas (Izquierda/Abajo/Arriba/Derecha). |
| `Ctrl + Flechas` | Redimensionar la ventana actual. |
| `<Space>bn` | Buffer siguiente. |
| `<Space>bp` | Buffer anterior. |
| `<Space>bd` | Cerrar (borrar) buffer actual. |

### Edición Rápida
| Atajo | Acción |
| :--- | :--- |
| `Alt + j` | Mover línea/bloque actual hacia abajo. |
| `Alt + k` | Mover línea/bloque actual hacia arriba. |
| `Ctrl + d` | Duplicar línea actual. |
| `Ctrl + a` | Seleccionar todo el archivo. |
| `<Space>s` | Buscar y Reemplazar interactivo (`:%s//gc`). |
| `<Space>c` | Limpiar resaltado de búsqueda. |

---

## 🔍 Navegación y Búsqueda

### Archivos (FZF / NERDTree)
| Atajo | Acción |
| :--- | :--- |
| `Ctrl + p` | **Búsqueda rápida de archivos** (Files). |
| `<Space>fg` | Buscar archivos trackeados por Git (GFiles). |
| `<Space>fb` | Buscar entre buffers abiertos. |
| `<Space>fl` | Buscar texto en líneas del buffer actual. |
| `<Space>ft` | Buscar Tags. |
| `F3` | Alternar árbol de archivos (NERDTree). |
| `<Space>e` | Ubicar archivo actual en el árbol (NERDTreeFind). |
| `F8` | Alternar estructura de código (Tagbar). |
| `F5` | Ver historial de cambios (UndoTree). |

### EasyMotion (Movimiento Rápido)
| Atajo | Acción |
| :--- | :--- |
| `<Space><Space>s` | Buscar 2 caracteres y saltar. |
| `<Space><Space>w` | Saltar al inicio de palabras. |
| `<Space><Space>f` | Buscar un carácter. |
| `<Space><Space>j` | Saltar líneas hacia abajo. |
| `<Space><Space>k` | Saltar líneas hacia arriba. |

---

## 🧠 Código e Inteligencia (LSP/CoC)

| Atajo | Acción |
| :--- | :--- |
| `gd` | Ir a la **definición** del símbolo. |
| `gy` | Ir a la definición de tipo. |
| `gi` | Ir a la implementación. |
| `gr` | Buscar referencias. |
| `K` | Mostrar documentación (Hover) en ventana flotante. |
| `<Space>rn` | **Renombrar** símbolo en todo el proyecto. |
| `<Space>f` | **Formatear** código seleccionado o archivo completo. |
| `[g` / `]g` | Ir al diagnóstico (error/warning) anterior / siguiente. |
| `<Tab>` / `<S-Tab>` | Navegar en la lista de autocompletado. |
| `<Enter>` | Confirmar autocompletado. |

---

## 🌳 Git

| Atajo | Acción |
| :--- | :--- |
| `<Space>gst` | Git Status. |
| `<Space>ga` | Git Add . (Todo). |
| `<Space>gc` | Git Commit. |
| `<Space>gsh` | Git Push. |
| `<Space>gll` | Git Pull. |
| `<Space>gb` | Git Branch. |
| `<Space>go` | Git Checkout. |
| `<Space>gn` | Ir al siguiente cambio (Hunk) en el archivo. |
| `<Space>gp` | Ir al cambio anterior. |
| `<Space>gh` | Stage Hunk (preparar solo este fragmento). |
| `<Space>gu` | Deshacer cambio en este fragmento. |

---

## 🏗️ Sistema de Layouts

### Layout de Desarrollo (Dev)
| Atajo | Acción |
| :--- | :--- |
| `<Space>dl` | **Cargar** Layout de Desarrollo (Código + 2 Terminales). |
| `<Space>la` | **Reajustar** tamaños de ventanas. |
| `<Space>t1` | Foco en Terminal 1. |
| `<Space>t2` | Foco en Terminal 2. |
| `<Space>r1` | Enviar comando a Terminal 1. |
| `<Space>r2` | Enviar comando a Terminal 2. |

### Layouts Personalizados (Custom)
| Atajo | Descripción |
| :--- | :--- |
| `<Space>lc` | **Iniciar** creación de layout. |
| `<Space>ln` | **Siguiente paso** (menú interactivo). |
| `<Space>lH` | Dividir Horizontalmente. |
| `<Space>lV` | Dividir Verticalmente. |
| `<Space>lT` | Agregar Terminal. |
| `<Space>le` | Agregar Editor. |
| `<Space>lr` | Redimensionar. |
| `<Space>ls` | **Guardar** layout actual. |
| `<Space>ll` | **Cargar** layout guardado. |
| `<Space>lq` | **Cerrar todo** y limpiar layout. |
| `<Space>li` | Información del layout actual. |

---

## 🤖 Sistemas Embebidos

### PlatformIO
| Atajo | Acción | Comando Real |
| :--- | :--- | :--- |
| `<Space>mb` | **Compilar** | `pio run` |
| `<Space>mu` | **Subir** | `pio run -t upload` |
| `<Space>mm` | **Monitor Serial** | `pio device monitor` |
| `<Space>mi` | **Init DB** | `pio run -t compiledb` (para autocompletado C++) |

### MicroPython (mpremote)
| Atajo | Acción | Comando Real |
| :--- | :--- | :--- |
| `<Space>ur` | **Ejecutar en RAM** | `mpremote run %` |
| `<Space>uu` | **Subir archivo** | `mpremote cp % :%:t` |
| `<Space>up` | **REPL** | `mpremote repl` |
| `<Space>ul` | **Listar archivos** | `mpremote ls` |
| `<Space>us` | **Soft Reset** | `mpremote soft-reset` |

---

## 📊 Ciencia de Datos y REPL (Quarto/Iron)

| Atajo | Acción |
| :--- | :--- |
| `<Space>rl` | Ejecutar línea actual. |
| `<Space>rb` | Ejecutar bloque/celda de código actual. |
| `<Space>rn` | Ejecutar bloque y avanzar. |
| `<Space>r` (Visual) | Ejecutar selección visual. |
| `<Space>rr` | Abrir/Cerrar consola REPL (IPython). |
| `<Space>pp` | Previsualizar documento Quarto. |
| `<Space>ps` | Detener previsualización. |
| `<Space>pr` | Renderizar documento Quarto. |

---

## 📝 LaTeX (VimTex)

| Atajo | Acción |
| :--- | :--- |
| `<Space>xc` | Compilar (Toggle continuous mode). |
| `<Space>xv` | Ver PDF. |
| `<Space>xe` | Ver errores. |
| `<Space>xk` | Detener compilación. |
| `<Space>xl` | Limpiar archivos auxiliares. |
| `<Space>xt` | Mostrar Índice (TOC). |

---

## 🌐 Web Development

| Atajo | Acción |
| :--- | :--- |
| `Ctrl + y,` | Expandir abreviatura **Emmet** (HTML/CSS). |
| `<Space>j...` | Menú **Sniprun** (Ejecutar fragmentos de JS/TS). |
