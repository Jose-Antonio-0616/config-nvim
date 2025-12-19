" =====================================================
" maps.vim - Mapeos de teclas personalizados
" =====================================================

" ============ Leader Key ============
let mapleader = " "
let maplocalleader = ","

" ============ Mapeos Básicos ============
" Guardar archivo
nnoremap <leader>w :w<CR>
" Salir sin guardar
nnoremap <leader>q :q!<CR>
" Guardar y salir
nnoremap <leader>wq :wq<CR>

" Moverse entre ventanas
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Redimensionar ventanas
nnoremap <C-Up> :resize -2<CR>
nnoremap <C-Down> :resize +2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

" Navegar entre buffers
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>

" ============ Plugins ============
" NERDTree
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <leader>e :NERDTreeFind<CR>

" FZF
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>ft :Tags<CR>
nnoremap <C-p> :Files<CR>

" Tagbar
nnoremap <F8> :TagbarToggle<CR>

" UndoTree
nnoremap <F5> :UndotreeToggle<CR>

" GitGutter
nnoremap <leader>gn :GitGutterNextHunk<CR>
nnoremap <leader>gp :GitGutterPrevHunk<CR>
nnoremap <leader>gh :GitGutterStageHunk<CR>
nnoremap <leader>gu :GitGutterUndoHunk<CR>

" Fugitive (Git)
nnoremap <leader>ga :Git add .<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gsh :Git push<CR>
nnoremap <leader>gll :Git pull<CR>
nnoremap <leader>gst :Git status<CR>
nnoremap <leader>gb :Git branch<CR>
nnoremap <leader>go :Git checkout<CR>

" ============ CoC.nvim ============
" Ir a definición
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Renombrar símbolo
nmap <leader>rn <Plug>(coc-rename)

" Formatear código seleccionado
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" Mostrar documentación
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Navegar por diagnósticos
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" ============ Edición ============
" Mover líneas arriba y abajo
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Duplicar línea
nnoremap <C-d> :copy .<CR>

" Seleccionar todo
nnoremap <C-a> ggVG

" Buscar y reemplazar
nnoremap <leader>s :%s//gc<left><left><left>

" Limpiar resaltado de búsqueda
nnoremap <leader>c :nohlsearch<CR>

" ============ Terminal ============
" Abrir terminal
nnoremap <leader>te :terminal<CR>
" Salir del modo terminal
tnoremap <Esc> <C-\><C-n>

" ============ Utilidades ============
" Recargar configuración
nnoremap <leader>R :source $MYVIMRC<CR>

" Mostrar menú de atajos de which-key manualmente si no aparece
nnoremap <silent> <leader>? :WhichKey ' '<CR>

" Mostrar/ocultar números de línea (cambio de mapeo para evitar conflictos)
nnoremap <leader>tn :set number!<CR>

" Alternar entre número relativo y absoluto (cambio de mapeo para evitar conflictos)
nnoremap <leader>tr :set relativenumber!<CR>

" ============ EasyMotion ============
" Movimiento a cualquier lugar con 2 caracteres
map <leader><leader>w <Plug>(easymotion-bd-w)
map <leader><leader>f <Plug>(easymotion-bd-f)
map <leader><leader>s <Plug>(easymotion-s2)

" Movimiento por líneas
map <leader><leader>j <Plug>(easymotion-j)
map <leader><leader>k <Plug>(easymotion-k)

" Buscar en toda la ventana
map <leader><leader>/ <Plug>(easymotion-sn)

" ============ Desarrollo Web ============
" Emmet
imap <C-y>, <plug>(emmet-expand-abbr)
imap <C-y>; <plug>(emmet-expand-word)
imap <C-y>u <plug>(emmet-update-tag)
imap <C-y>d <plug>(emmet-balance-tag-inward)
imap <C-y>D <plug>(emmet-balance-tag-outward)

" HTML tags
nnoremap <leader>ht :set filetype=html<CR>

" ============ Layout de Desarrollo ============
" Layout 'dev'
nnoremap <leader>dl :call CreateDevLayout()<CR>
nnoremap <leader>la :call AdjustDevLayout()<CR> " Reajustar layout

" Funciones generales de layout
nnoremap <leader>li :call ShowCurrentLayoutInfo()<CR>
nnoremap <leader>lS :call SaveLayoutState(input('Nombre del layout: '))<CR>
nnoremap <leader>lq :call CloseAllLayoutWindows()<CR>

" Sistema de layout 'custom'
nnoremap <leader>lc :call StartCustomLayout()<CR>
nnoremap <leader>ln :call NextLayoutStep()<CR>
nnoremap <leader>lH :call CustomSplitHorizontal()<CR>
nnoremap <leader>lV :call CustomSplitVertical()<CR>
nnoremap <leader>lT :call CustomTerminal()<CR>
nnoremap <leader>le :call CustomEditor()<CR>
nnoremap <leader>lr :call CustomResize()<CR>
nnoremap <leader>ld :call FinishCustomLayout()<CR>
nnoremap <leader>ls :call SaveCustomLayout()<CR>
nnoremap <leader>ll :call LoadCustomLayout()<CR>
nnoremap <leader>lm :call ManageCustomLayouts()<CR>

" ============ Quarto y REPL (Iron) ============
" Nuevo grupo <leader>p (Quarto)
nnoremap <leader>pp <Cmd>QuartoPreview<CR>     " Previsualizar Quarto
nnoremap <leader>ps <Cmd>QuartoClosePreview<CR> " Detener Previsualización
nnoremap <leader>pr <Cmd>QuartoRender<CR>      " Renderizar Quarto

" ============ LaTeX (VimTex) ============
nnoremap <leader>xc :VimtexCompile<CR>
nnoremap <leader>xv :VimtexView<CR>
nnoremap <leader>xe :VimtexErrors<CR>
nnoremap <leader>xk :VimtexStop<CR>
nnoremap <leader>xl :VimtexClean<CR>
nnoremap <leader>xt :VimtexTocToggle<CR>
nnoremap <leader>xi :VimtexInfo<CR>

" ============ Which-key (Menú de ayuda) ============
" Mostrar menú de atajos
nnoremap <leader>? :WhichKey<CR>
