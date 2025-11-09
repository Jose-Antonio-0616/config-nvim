# 🔥 Guía de Atajos de Teclado - Neovim

> **Leader Key:** `<Space>` (Barra espaciadora)

Esta guía está generada directamente desde la configuración (`plugin-config.vim`) y refleja los atajos de teclado reales.

---

## 🎯 **Atajos Generales**

| Atajo | Descripción |
|-------|-------------|
| `<Space>w` | Guardar archivo |
| `<Space>q` | Salir sin guardar (forzado) |
| `<Space>wq` | Guardar y Salir |
| `<Space>R` | Recargar configuración de Neovim |
| `<Space>c` | Limpiar el resaltado de la última búsqueda |
| `<Space>s` | Buscar y reemplazar en el archivo (`:%s//gc`) |
| `<Space>e` | Abrir explorador y buscar archivo actual (NERDTree) |
| `<Space>rn` | Renombrar símbolo (LSP / CoC) |
| `<Space>?` | Mostrar este menú de ayuda (WhichKey) |

---

## 🔍 **Búsqueda y Formato (FZF)**

| Atajo | Descripción |
|-------|-------------|
| `<Space>f` | **Formatear** código seleccionado (LSP / CoC) |
| `<Space>fg` | Buscar en archivos de Git |
| `<Space>fb` | Buscar en buffers abiertos |
| `<Space>fl` | Buscar en líneas del archivo actual |
| `<Space>ft` | Buscar tags en el proyecto |

---

## 🔀 **Git (Fugitive & GitGutter)**

| Atajo | Descripción |
|-------|-------------|
| `<Space>ga` | `git add .` (Añadir todos los cambios) |
| `<Space>gc` | `git commit` |
| `<Space>gst` | `git status` |
| `<Space>gsh` | `git push` |
| `<Space>gll` | `git pull` |
| `<Space>gb` | `git branch` |
| `<Space>go` | `git checkout` |
| `<Space>gn` | Ir al siguiente "hunk" (cambio) de Git |
| `<Space>gp` | Ir al "hunk" (cambio) de Git anterior |
| `<Space>gh` | "Stage" el hunk actual (`git add -p`) |
| `<Space>gu` | Deshacer los cambios en el hunk actual |

---

## 📂 **Buffers**

| Atajo | Descripción |
|-------|-------------|
| `<Space>bn` | Buffer siguiente |
| `<Space>bp` | Buffer anterior |
| `<Space>bd` | Eliminar buffer actual |

---

## 💻 **Terminal**

| Atajo | Descripción |
|-------|-------------|
| `<Space>te` | Abrir una nueva terminal en una ventana |
| `<Space>tn` | Alternar visibilidad de números de línea |
| `<Space>tr` | Alternar entre números de línea relativos/absolutos |
| `<Space>t1` | Ir/Alternar Terminal 1 (del Layout Dev) |
| `<Space>t2` | Ir/Alternar Terminal 2 (del Layout Dev) |

---

## 🎨 **Sistema de Layouts**

### **Layout de Desarrollo**
| Atajo | Descripción |
|-------|-------------|
| `<Space>dl` | Crear el Layout de Desarrollo (Editor + 2 Terminales) |
| `<Space>la` | Reajustar las proporciones del Layout |

### **Layouts Personalizados**
| Atajo | Descripción |
|-------|-------------|
| `<Space>lc` | **Iniciar** la creación de un layout personalizado |
| `<Space>ln` | Ir al **siguiente paso** en la creación |
| `<Space>lH` | Añadir una división **Horizontal** |
| `<Space>lV` | Añadir una división **Vertical** |
| `<Space>lT` | Añadir una **Terminal** en la ventana actual |
| `<Space>le` | Añadir un **Editor** en la ventana actual |
| `<Space>lr` | **Redimensionar** la ventana actual |
| `<Space>ld` | **Terminar** el proceso de creación del layout |
| `<Space>ls` | **Guardar** el layout personalizado actual |
| `<Space>ll` | **Cargar** un layout personalizado guardado |
| `<Space>lm` | **Gestionar** (listar) los layouts guardados |
| `<Space>lq` | **Cerrar todas las ventanas** del layout (volver a una) |
| `<Space>li` | Mostrar **Información** del layout actual |
| `<Space>lS` | Guardar el **Estado** de la sesión actual |

---

## 🚀 **Ejecución de Comandos (Run)**

| Atajo | Descripción |
|-------|-------------|
| `<Space>r1` | Ejecutar un comando en el Terminal 1 |
| `<Space>r2` | Ejecutar un comando en el Terminal 2 |

---

## ✨ **EasyMotion (Navegación Rápida)**

> El prefijo es `<Space><Space>`

| Atajo | Descripción |
|-------|-------------|
| `<Space><Space>w` | Saltar a cualquier palabra que empiece con... |
| `<Space><Space>f` | Saltar a cualquier caracter... |
| `<Space><Space>s` | Buscar y saltar a 2 caracteres |
| `<Space><Space>j` | Saltar a cualquier línea hacia abajo |
| `<Space><Space>k` | Saltar a cualquier línea hacia arriba |
| `<Space><Space>/` | Buscar y saltar a cualquier texto en la pantalla |

---

*📝 Actualizado: 2025 - Guía generada desde la configuración.*