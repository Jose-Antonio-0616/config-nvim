" =====================================================
" init.vim - Configuración principal de Neovim
" =====================================================

" Cargar configuraciones básicas
source ~/.config/nvim/basic-config.vim

" Cargar plugins
source ~/.config/nvim/plugins.vim

" Cargar configuración de plugins
source ~/.config/nvim/plugin-config.vim

" Cargar mapeos de teclas
source ~/.config/nvim/maps.vim

" Cargar configuración de which-key (menú de atajos) solo si existe el plugin
"if isdirectory(expand('~/.local/share/nvim/plugged/which-key.nvim'))
"    source ~/.config/nvim/which-key-config.vim
"endif

" Comando manual para recargar which-key si es necesario
command! ReloadWhichKey source ~/.config/nvim/which-key-config.vim

