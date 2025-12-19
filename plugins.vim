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
Plug 'stevearc/dressing.nvim'               " Mejor UI para inputs
Plug 'nvim-lua/plenary.nvim'                " Dependencia para avante
Plug 'MunifTanjim/nui.nvim'                 " Dependencia para avante

" ============ Python y Django ============
Plug 'Vimjas/vim-python-pep8-indent'      " Indentación PEP8
Plug 'tweekmonster/django-plus.vim'       " Soporte mejorado para Django

" ============ Web Development ============
Plug 'mattn/emmet-vim'                    " Emmet para HTML/CSS
Plug 'ap/vim-css-color'                   " Mostrar colores CSS

" ============ Latex =============
Plug 'lervag/vimtex'             

" ============ Quarto ============
Plug 'quarto-dev/quarto-nvim'
Plug 'Vigemus/iron.nvim'
Plug 'jmbuhr/otter.nvim'

" ============ Utilidades ============
Plug 'mbbill/undotree'                    " Historial de cambios
Plug 'folke/which-key.nvim'               " Menú de atajos de teclado
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Syntax highlighting mejorado
Plug 'luochen1990/rainbow'                " Mejores brackets y delimitadores
Plug 'NoahTheDuke/vim-just'               " Resaltado de sintaxis de justfile

call plug#end()

" Auto-instalación de plugins al guardar este archivo
autocmd BufWritePost plugins.vim source % | PlugInstall
