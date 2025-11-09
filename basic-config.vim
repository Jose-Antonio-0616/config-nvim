" =====================================================
" basic-config.vim - Configuraciones básicas de Neovim
" =====================================================

" ============ Configuraciones Generales ============
set encoding=utf-8              " Codificación UTF-8
set fileencoding=utf-8          " Codificación de archivos
set mouse=a                     " Habilitar mouse
set clipboard+=unnamedplus       " Usar clipboard del sistema
set updatetime=300              " Tiempo de actualización más rápido
set timeoutlen=500              " Tiempo de espera para mapeos

" ============ Interfaz ============
set number                      " Mostrar números de línea
set relativenumber              " Números de línea relativos
set cursorline                  " Resaltar línea actual
set showmatch                   " Mostrar paréntesis coincidentes
set splitbelow                  " Nuevas ventanas horizontales abajo
set splitright                  " Nuevas ventanas verticales a la derecha
set signcolumn=yes              " Siempre mostrar columna de signos
" set colorcolumn=80              " Línea guía en columna 80 (deshabilitada)

" ============ Apariencia ============
set termguicolors               " Soporte para colores true color
syntax enable                   " Habilitar sintaxis
set background=dark             " Fondo oscuro por defecto
set scrolloff=8                 " Mantener 8 líneas visibles arriba/abajo
set sidescrolloff=8             " Mantener 8 columnas visibles izq/der

" ============ Búsqueda ============
set ignorecase                  " Ignorar mayúsculas en búsqueda
set smartcase                   " Ser inteligente con mayúsculas
set incsearch                   " Búsqueda incremental
set hlsearch                    " Resaltar resultados de búsqueda
set wrapscan                    " Búsqueda circular

" ============ Indentación ============
set autoindent                  " Auto-indentación
set smartindent                 " Indentación inteligente
set expandtab                   " Usar espacios en lugar de tabs
set tabstop=4                   " Tamaño de tab = 4 espacios
set softtabstop=4               " Espacios por tab en modo inserción
set shiftwidth=4                " Espacios para auto-indentación
set shiftround                  " Redondear indentación

" ============ Archivos y Backups ============
set noswapfile                  " No crear archivos swap
set nobackup                    " No crear backups
set writebackup                 " Backup temporal al escribir
set undofile                    " Habilitar historial de deshacer
set undolevels=1000             " Niveles de deshacer
set undoreload=10000            " Líneas a recordar para deshacer

" Crear directorio de undo si no existe
if !isdirectory($HOME.'/.local/share/nvim/undo')
    call mkdir($HOME.'/.local/share/nvim/undo', 'p', 0700)
endif
set undodir=~/.local/share/nvim/undo

" ============ Comportamiento ============
set hidden                      " Permitir buffers ocultos
set confirm                     " Confirmar cambios al salir
set autoread                    " Leer automáticamente archivos modificados
set backspace=indent,eol,start  " Backspace más inteligente
set formatoptions-=cro          " No continuar comentarios automáticamente

" ============ Wildmenu (Autocompletado de comandos) ============
set wildmenu                    " Habilitar wildmenu
set wildmode=longest:full,full  " Modo de completado
set wildignore=*.o,*~,*.pyc     " Ignorar ciertos archivos
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" ============ Folding (Plegado) ============
set foldmethod=indent           " Plegado por indentación
set foldlevelstart=99           " Empezar con todo desplegado
set foldenable                  " Habilitar folding

" ============ Statusline ============
set laststatus=2                " Siempre mostrar statusline
set showcmd                     " Mostrar comandos en statusline
set showmode                    " Mostrar modo actual

" ============ Configuraciones específicas por tipo de archivo ============
" Espacios para diferentes tipos de archivo
" Web development (2 espacios)
autocmd FileType html,css,scss,sass,less,javascript,typescript,json setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType yaml,yml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Python (4 espacios - PEP8)
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 textwidth=88
autocmd FileType python setlocal foldmethod=indent

" Makefiles requieren tabs reales
autocmd FileType make setlocal noexpandtab

" Django templates
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Eliminar espacios en blanco al final al guardar
autocmd BufWritePre * :%s/\s\+$//e

" Recordar posición del cursor
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ============ Configuraciones de rendimiento ============
set lazyredraw                  " No redibujar durante macros
set ttyfast                     " Terminal rápida
set synmaxcol=200               " Limitar sintaxis a 200 columnas
