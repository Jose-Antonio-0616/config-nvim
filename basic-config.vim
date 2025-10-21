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
autocmd FileType javascriptreact,typescriptreact,jsx,tsx setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType yaml,yml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Python (4 espacios - PEP8)
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 textwidth=88
autocmd FileType python setlocal foldmethod=indent

" PHP (4 espacios)
autocmd FileType php setlocal shiftwidth=4 tabstop=4 softtabstop=4

" C++ (2 o 4 espacios según preferencia)
autocmd FileType cpp,c setlocal shiftwidth=4 tabstop=4 softtabstop=4

" SQL (2 espacios)
autocmd FileType sql,pgsql,mysql setlocal shiftwidth=2 tabstop=2 softtabstop=2

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
set synmaxcol=200              " Limitar sintaxis a 200 columnas

" ============ Configuraciones de terminal ============
if has('nvim')
    " Configuraciones específicas de Neovim
    set inccommand=split        " Vista previa de sustituciones
    
    " ============ Integración con Warp Terminal ============
    " Detectar si estamos en Warp Terminal
    if $TERM_PROGRAM ==# 'WarpTerminal' || exists('$WARP_TERMINAL_SESSION_ID')
        " Configuraciones específicas para Warp
        set title                    " Habilitar título de ventana
        set titlestring=Neovim:\ %F   " Formato del título
        
        " Optimizaciones para Warp
        set ttyfast                  " Terminal rápida
        set lazyredraw               " No redibujar durante macros
        
        " Cursor shapes para Warp (mejor integración visual)
        let &t_SI = "\e[6 q"        " Insert mode: line cursor
        let &t_EI = "\e[2 q"        " Normal mode: block cursor
        let &t_SR = "\e[4 q"        " Replace mode: underline cursor
        
        " Soporte mejorado para colores en Warp
        if has('termguicolors')
            set termguicolors
            " Forzar soporte para colores RGB
            let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
            let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        endif
        
        " Configuraciones de clipboard para Warp
        if has('clipboard')
            set clipboard=unnamedplus
            " Optimizar para Warp's clipboard integration
            let g:clipboard = {
                \ 'name': 'warp-clipboard',
                \ 'copy': {
                \   '+': 'wl-copy --type text/plain',
                \   '*': 'wl-copy --type text/plain --primary',
                \ },
                \ 'paste': {
                \   '+': 'wl-paste --no-newline',
                \   '*': 'wl-paste --no-newline --primary',
                \ },
                \ 'cache_enabled': 1,
                \ }
        endif
        
        " Configuraciones de mouse optimizadas para Warp
        set mouse=a
        set mousemodel=popup
        
        " Configurar escape sequences para mejor responsividad
        set ttimeout
        set ttimeoutlen=50
        
        " Soporte para notificaciones de Warp
        if executable('warp-notify')
            function! WarpNotify(message, level)
                silent! call system('warp-notify "' . a:message . '" --level ' . a:level)
            endfunction
        endif
        
        " Integración con Warp AI
        if exists('$WARP_AI_ENABLED')
            " Configuraciones para AI features de Warp
            set showmode                 " Mostrar modo para AI context
            set showcmd                  " Mostrar comandos para AI context
        endif
        
        echo "🚀 Warp Terminal detected - optimizations enabled"
    else
        " Configuraciones para otros terminales
        if has('termguicolors')
            set termguicolors
        endif
    endif
endif
