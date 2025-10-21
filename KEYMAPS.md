# 🔥 Guía de Atajos de Teclado - Neovim

> **Leader Key:** `<Space>` (Barra espaciadora)

## 🎯 **Atajos Básicos**

### **Navegación y Ventanas**
| Atajo | Descripción |
|-------|-------------|
| `Ctrl+h` | Moverse a ventana izquierda |
| `Ctrl+j` | Moverse a ventana inferior |
| `Ctrl+k` | Moverse a ventana superior |
| `Ctrl+l` | Moverse a ventana derecha |
| `Ctrl+Up` | Redimensionar ventana (más alta) |
| `Ctrl+Down` | Redimensionar ventana (más baja) |
| `Ctrl+Left` | Redimensionar ventana (más estrecha) |
| `Ctrl+Right` | Redimensionar ventana (más ancha) |

### **Buffers**
| Atajo | Descripción |
|-------|-------------|
| `<Space>bn` | Buffer siguiente |
| `<Space>bp` | Buffer anterior |
| `<Space>bd` | Eliminar buffer actual |

### **Archivo y Salir**
| Atajo | Descripción |
|-------|-------------|
| `<Space>w` | Guardar archivo |
| `<Space>q` | Salir sin guardar (forzado) |
| `<Space>wq` | Guardar y salir |
| `<Space>r` | Recargar configuración |

---

## 📁 **Explorador de Archivos (NERDTree)**

| Atajo | Descripción |
|-------|-------------|
| `F3` | Alternar NERDTree |
| `<Space>e` | Alternar NERDTree |
| `<Space>f` | Buscar archivo actual en NERDTree |

---

## 🔍 **Búsqueda y Archivos (FZF)**

| Atajo | Descripción |
|-------|-------------|
| `<Space>ff` | Buscar archivos |
| `<Space>fg` | Buscar archivos Git |
| `<Space>fb` | Buscar en buffers |
| `<Space>fl` | Buscar líneas |
| `<Space>ft` | Buscar tags |
| `Ctrl+p` | Buscar archivos (alternativo) |
| `<Space><Space>` | Limpiar búsqueda resaltada |

---

## 🔧 **CoC.nvim (LSP y Autocompletado)**

### **Navegación de Código**
| Atajo | Descripción |
|-------|-------------|
| `gd` | Ir a definición |
| `gy` | Ir a tipo de definición |
| `gi` | Ir a implementación |
| `gr` | Mostrar referencias |
| `K` | Mostrar documentación |
| `<Space>rn` | Renombrar símbolo |

### **Diagnósticos**
| Atajo | Descripción |
|-------|-------------|
| `[g` | Diagnóstico anterior |
| `]g` | Diagnóstico siguiente |

### **Formato**
| Atajo | Descripción |
|-------|-------------|
| `<Space>f` | Formatear código seleccionado |

---

## ✏️ **Edición Avanzada**

### **Mover Líneas**
| Atajo | Descripción |
|-------|-------------|
| `Alt+j` | Mover línea hacia abajo |
| `Alt+k` | Mover línea hacia arriba |

### **Utilidades**
| Atajo | Descripción |
|-------|-------------|
| `Ctrl+d` | Duplicar línea |
| `Ctrl+a` | Seleccionar todo |
| `<Space>s` | Buscar y reemplazar |

---

## 🐍 **Python y Django**

### **Ejecución**
| Atajo | Descripción |
|-------|-------------|
| `<Space>py` | Ejecutar Python actual |
| `<Space>pv` | Ejecutar con entorno virtual |
| `<Space>ds` | Django runserver |
| `<Space>dm` | Django makemigrations |
| `<Space>dmi` | Django migrate |

### **Entornos Virtuales**
| Atajo | Descripción |
|-------|-------------|
| `<Space>va` | Activar entorno ./myenv |
| `<Space>vc` | Activar entorno personalizado |
| `<Space>vw` | Mostrar entorno activo |
| `<Space>pi` | Instalar paquetes pip |

---

## 🌐 **Desarrollo Web**

### **JavaScript/React**
| Atajo | Descripción |
|-------|-------------|
| `<Space>js` | Ejecutar Node.js |
| `<Space>ni` | npm install |
| `<Space>ns` | npm start |
| `<Space>nb` | npm run build |
| `<Space>nt` | npm test |

### **Emmet**
| Atajo | Descripción |
|-------|-------------|
| `Ctrl+y,` | Expandir abreviación Emmet |
| `Ctrl+y;` | Expandir palabra Emmet |
| `Ctrl+yu` | Actualizar tag |

### **PHP**
| Atajo | Descripción |
|-------|-------------|
| `<Space>php` | Ejecutar PHP actual |

### **C++**
| Atajo | Descripción |
|-------|-------------|
| `<Space>cpp` | Compilar y ejecutar C++ |
| `<Space>cc` | Solo compilar C++ |

---

## 🎨 **Sistema de Layouts**

### **Layouts Predefinidos**
| Atajo | Descripción |
|-------|-------------|
| `<Space>dl` | Layout Dev (4 ventanas) |
| `<Space>ds` | Layout Simple |
| `<Space>dd` | Layout Lateral |
| `<Space>dt` | Layout Triple |

### **Layouts Especializados**
| Atajo | Descripción |
|-------|-------------|
| `<Space>db` | Layout Debug |
| `<Space>dv` | Layout Code Review |
| `<Space>dT` | Layout Testing |
| `<Space>dD` | Layout Documentación |
| `<Space>df` | Layout Focus |
| `<Space>lf` | Salir del Layout Focus |

### **Quick Switch (Acceso Rápido)**
| Atajo | Descripción |
|-------|-------------|
| `<Space>q1` | Layout rápido 1 (dev) |
| `<Space>q2` | Layout rápido 2 (debug) |
| `<Space>q3` | Layout rápido 3 (test) |
| `<Space>q4` | Layout rápido 4 (focus) |
| `Ctrl+Alt+1` | Layout rápido 1 (alternativo) |
| `Ctrl+Alt+2` | Layout rápido 2 (alternativo) |
| `Ctrl+Alt+3` | Layout rápido 3 (alternativo) |
| `Ctrl+Alt+4` | Layout rápido 4 (alternativo) |

### **Configuración Quick Switch**
| Atajo | Descripción |
|-------|-------------|
| `<Space>qc` | Configurar layouts rápidos |
| `<Space>qs` | Mostrar información layouts |

### **Layout Personalizado**
| Atajo | Descripción |
|-------|-------------|
| `<Space>lc` | Iniciar layout personalizado |
| `<Space>ln` | Siguiente paso |
| `<Space>lh` | División horizontal básica |
| `<Space>lv` | División vertical básica |
| `<Space>lt` | Terminal aquí |
| `<Space>lH` | División horizontal personalizada |
| `<Space>lV` | División vertical personalizada |
| `<Space>lT` | Terminal personalizado |
| `<Space>le` | Editor aquí |
| `<Space>lr` | Redimensionar |
| `<Space>ld` | Terminar layout personalizado |

### **Gestión de Layouts**
| Atajo | Descripción |
|-------|-------------|
| `<Space>ls` | Guardar layout personalizado |
| `<Space>ll` | Cargar layout guardado |
| `<Space>lm` | Gestionar layouts |
| `<Space>lq` | **Cerrar layout completo** |
| `<Space>li` | Información del layout actual |
| `<Space>lp` | Sugerir layout para proyecto |
| `<Space>lS` | Guardar estado con nombre |
| `<Space>lL` | Cargar estado guardado |

---

## 💻 **Terminales Integrados**

### **Navegación**
| Atajo | Descripción |
|-------|-------------|
| `<Space>te` | Abrir terminal |
| `<Space>t1` | Alternar terminal 1 |
| `<Space>t2` | Alternar terminal 2 |
| `Esc` | Salir modo terminal (a normal) |

### **Comandos en Terminales**
| Atajo | Descripción |
|-------|-------------|
| `<Space>r1` | Ejecutar comando en terminal 1 |
| `<Space>r2` | Ejecutar comando en terminal 2 |
| `<Space>dr` | Django runserver en terminal 1 |
| `<Space>dx` | Ejecutar tests en terminal 2 |
| `<Space>dva` | Activar venv en ambos terminales |

### **Navegación entre Ventanas del Layout**
| Atajo | Descripción |
|-------|-------------|
| `<Space>1` | Ir a ventana izquierda |
| `<Space>2` | Ir a ventana derecha |
| `<Space>3` | Ir a ventana inferior |
| `<Space>4` | Ir a ventana superior |
| `Alt+1` | Primera ventana |
| `Alt+2` | Segunda ventana |
| `Alt+3` | Tercera ventana |
| `Alt+4` | Cuarta ventana |

---

## 🔀 **Git (GitGutter + Fugitive)**

### **GitGutter**
| Atajo | Descripción |
|-------|-------------|
| `<Space>gn` | Siguiente cambio |
| `<Space>gp` | Cambio anterior |
| `<Space>gs` | Preparar cambio |
| `<Space>gu` | Deshacer cambio |

### **Fugitive**
| Atajo | Descripción |
|-------|-------------|
| `<Space>ga` | Git add . |
| `<Space>gc` | Git commit |
| `<Space>gsh` | Git push |
| `<Space>gll` | Git pull |
| `<Space>gst` | Git status |
| `<Space>gb` | Git branch |
| `<Space>go` | Git checkout |

---

## 🗄️ **Base de Datos (vim-dadbod)**

| Atajo | Descripción |
|-------|-------------|
| `<Space>db` | Alternar UI de base de datos |
| `<Space>sq` | Ejecutar consulta SQL |

---

## 🚀 **EasyMotion**

| Atajo | Descripción |
|-------|-------------|
| `<Space><Space>w` | Saltar a palabra |
| `<Space><Space>f` | Saltar a carácter |
| `<Space><Space>s` | Buscar 2 caracteres |
| `<Space><Space>j` | Saltar línea abajo |
| `<Space><Space>k` | Saltar línea arriba |
| `<Space><Space>/` | Buscar en ventana |

---

## 🎯 **Utilidades Avanzadas**

### **UndoTree**
| Atajo | Descripción |
|-------|-------------|
| `F5` | Alternar UndoTree |
| `<Space>u` | Alternar UndoTree |

### **Tagbar**
| Atajo | Descripción |
|-------|-------------|
| `F8` | Alternar Tagbar |
| `<Space>t` | Alternar Tagbar |

### **Números de Línea**
| Atajo | Descripción |
|-------|-------------|
| `<Space>tn` | Alternar números de línea |
| `<Space>tr` | Alternar números relativos |

---

## 🤖 **Avante.nvim (AI Assistant)**

### **Comandos Principales**
| Atajo | Descripción |
|-------|-------------|
| `<Space>aa` | Preguntar al AI |
| `<Space>ae` | Editar código con AI |
| `<Space>ar` | Refrescar respuesta del AI |

---

## 🛠️ **Warp Terminal Integration**

> Solo disponible si usas Warp Terminal

| Atajo | Descripción |
|-------|-------------|
| `<Space>wv` | Nuevo panel vertical Warp |
| `<Space>wh` | Nuevo panel horizontal Warp |
| `<Space>wc` | Ejecutar comando Warp |
| `<Space>wa` | Warp AI prompt |
| `<Space>ws` | Sincronizar tema con Warp |
| `<Space>wp` | Actualizar estado proyecto |
| `<Space>wt` | npm test en Warp |
| `<Space>wr` | npm run dev en Warp |
| `<Space>wb` | npm run build en Warp |

---

## 📚 **VimWiki**

### **Comandos por Defecto**
| Atajo | Descripción |
|-------|-------------|
| `<Space>ww` | Abrir wiki principal |
| `<Space>wt` | Abrir wiki en tab |
| `<Space>ws` | Seleccionar wiki |
| `<Space>wd` | Eliminar página wiki |
| `<Space>wr` | Renombrar página wiki |

---

## ❓ **Ayuda y Which-key**

| Atajo | Descripción |
|-------|-------------|
| `<Space>?` | Mostrar menú which-key |
| `<Space>h` | Ayuda which-key |

---

## 🎛️ **Funciones Especiales**

### **Restauración Automática**
- Al abrir Neovim sin argumentos, restaura automáticamente el último layout y archivos
- Al cerrar con `<Space>lq`, guarda el estado actual para restauración futura

### **Detección de Proyecto**
- `:LayoutSuggest` detecta el tipo de proyecto y sugiere el layout apropiado
- Soporta Django, React, Vue, Angular, PHP, C++, Python, Node.js y Documentación

### **Persistencia Inteligente**
- Auto-guardado al salir de Neovim
- Restauración selectiva basada en contexto
- Gestión de estados de layout con timestamps

---

## 🏷️ **Teclas de Función**

| Atajo | Descripción |
|-------|-------------|
| `F3` | NERDTree |
| `F5` | UndoTree |
| `F8` | Tagbar |

---

## 💡 **Tips y Trucos**

1. **Para layouts rápidos**: Usa `<Space>q1-q4` para cambiar entre tus layouts favoritos
2. **Para cerrar todo**: `<Space>lq` cierra el layout completo y guarda el estado
3. **Restauración automática**: Al reabrir Neovim, tus archivos se restauran automáticamente
4. **Navegación rápida**: `Alt+1-4` para saltar entre ventanas del layout
5. **Terminal integrado**: Los terminales se mantienen al cambiar entre layouts
6. **Detección de proyecto**: `<Space>lp` sugiere el mejor layout para tu proyecto

---

*📝 Actualizado: 2024 - Sistema de Layouts v2.0 con persistencia inteligente*
