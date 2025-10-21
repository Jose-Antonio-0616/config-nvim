" =====================================================
" plugins.vim - Gestión de plugins con vim-plug
" =====================================================

" Auto-instalación de vim-plug si no está presente
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" ============ Temas y Apariencia ============
Plug 'paulo-granthon/hyper.nvim'          " Tema hyper
Plug 'vim-airline/vim-airline'            " Barra de estado
Plug 'vim-airline/vim-airline-themes'     " Temas para airline
Plug 'ryanoasis/vim-devicons'             " Iconos para archivos
Plug 'nvim-tree/nvim-web-devicons'        " Iconos web para Neovim

" ============ Navegación y Exploración ============
Plug 'preservim/nerdtree'                 " Explorador de archivos
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                   " Búsqueda fuzzy
Plug 'easymotion/vim-easymotion'          " Movimientos rapidos

" ============ Edición y Productividad ============
Plug 'tpope/vim-commentary'               " Comentarios rápidos
Plug 'tpope/vim-surround'                 " Manipular delimitadores
Plug 'jiangmiao/auto-pairs'               " Auto-completado de pares
Plug 'preservim/tagbar'                   " Navegador de tags

" ============ Git ============
Plug 'tpope/vim-fugitive'                 " Integración con Git
Plug 'airblade/vim-gitgutter'             " Mostrar cambios de Git

" ============ LSP y Autocompletado ============
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'npm ci && npm install reflect-metadata'}  " Autocompletado y LSP

" Avante.nvim - AI Assistant (requiere Node.js)

Plug 'stevearc/dressing.nvim'                " Mejor UI para inputs
Plug 'nvim-lua/plenary.nvim'                " Dependencia para avante
Plug 'MunifTanjim/nui.nvim'                 " Dependencia para avante

" ============ Sintaxis y Lenguajes ============
Plug 'sheerun/vim-polyglot'               " Soporte multilenguaje
" Plug 'dense-analysis/ale'               " Linting asíncrono (DESHABILITADO - usando CoC.nvim)

" ============ Python y Django ============
Plug 'vim-python/python-syntax'           " Sintaxis mejorada para Python
Plug 'Vimjas/vim-python-pep8-indent'      " Indentación PEP8
Plug 'jeetsukumaran/vim-pythonsense'      " Navegación por objetos Python
Plug 'tweekmonster/django-plus.vim'       " Soporte mejorado para Django

" ============ Web Development ============
Plug 'mattn/emmet-vim'                    " Emmet para HTML/CSS
Plug 'alvan/vim-closetag'                 " Auto-cerrar tags HTML
Plug 'AndrewRadev/tagalong.vim'           " Sincronizar tags HTML
Plug 'hail2u/vim-css3-syntax'             " Sintaxis CSS3
Plug 'ap/vim-css-color'                   " Mostrar colores CSS

" ============ JavaScript y React ============
Plug 'pangloss/vim-javascript'            " Sintaxis JavaScript mejorada
Plug 'maxmellon/vim-jsx-pretty'           " Sintaxis JSX/React
Plug 'leafgarland/typescript-vim'         " Soporte TypeScript
Plug 'peitalin/vim-jsx-typescript'        " JSX + TypeScript

" ============ Tailwind CSS ============
Plug 'tailwindlabs/tailwindcss-intellisense', { 'do': 'npm install' }

" ============ PHP ============
Plug 'StanAngeloff/php.vim'               " Sintaxis PHP mejorada
Plug '2072/PHP-Indenting-for-VIm'         " Indentación PHP
Plug 'adoy/vim-php-refactoring-toolbox'   " Refactoring PHP

" ============ C++ ============
Plug 'octol/vim-cpp-enhanced-highlight'   " Resaltado C++ mejorado
Plug 'rhysd/vim-clang-format'             " Formateo con clang-format

" ============ SQL/PostgreSQL ============
Plug 'lifepillar/pgsql.vim'               " Sintaxis PostgreSQL
Plug 'tpope/vim-dadbod'                   " Interfaz de base de datos
Plug 'kristijanhusak/vim-dadbod-ui'       " UI para vim-dadbod
Plug 'kristijanhusak/vim-dadbod-completion' " Autocompletado SQL

" ============ Utilidades ============
Plug 'mbbill/undotree'                    " Historial de cambios
Plug 'vimwiki/vimwiki'                    " Wiki personal
Plug 'folke/which-key.nvim'               " Menú de atajos de teclado
" Syntax highlighting mejorado
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Mejores brackets y delimitadores
Plug 'luochen1990/rainbow'

call plug#end()

" Auto-instalación de plugins al guardar este archivo
autocmd BufWritePost plugins.vim source % | PlugInstall
