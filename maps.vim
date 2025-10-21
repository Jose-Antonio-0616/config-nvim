" =====================================================
" maps.vim - Mapeos de teclas personalizados
" =====================================================

" ============ Leader Key ============
let mapleader = " "
let maplocalleader = " "

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
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" FZF
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>ft :Tags<CR>
nnoremap <C-p> :Files<CR>

" Tagbar
nnoremap <F8> :TagbarToggle<CR>
nnoremap <leader>t :TagbarToggle<CR>

" UndoTree
nnoremap <F5> :UndotreeToggle<CR>
nnoremap <leader>u :UndotreeToggle<CR>

" GitGutter
nnoremap <leader>gn :GitGutterNextHunk<CR>
nnoremap <leader>gp :GitGutterPrevHunk<CR>
nnoremap <leader>gs :GitGutterStageHunk<CR>
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
nnoremap <leader><space> :nohlsearch<CR>

" ============ Terminal ============
" Abrir terminal
nnoremap <leader>te :terminal<CR>
" Salir del modo terminal
tnoremap <Esc> <C-\><C-n>

" ============ Utilidades ============
" Recargar configuración
nnoremap <leader>r :source $MYVIMRC<CR>

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



" ============ VimWiki ============
" Los mapeos por defecto de VimWiki:
" <leader>ww - Abrir wiki principal
" <leader>wt - Abrir wiki en tab
" <leader>ws - Seleccionar wiki
" <leader>wd - Eliminar página wiki
" <leader>wr - Renombrar página wiki

" ============ Desarrollo Web ============
" Emmet
imap <C-y>, <plug>(emmet-expand-abbr)
imap <C-y>; <plug>(emmet-expand-word)
imap <C-y>u <plug>(emmet-update-tag)
imap <C-y>d <plug>(emmet-balance-tag-inward)
imap <C-y>D <plug>(emmet-balance-tag-outward)

" HTML tags
nnoremap <leader>ht :set filetype=html<CR>

" ============ Python/Django ============
" Ejecutar Python
nnoremap <leader>py :!python3 %<CR>
" Ejecutar Python con entorno virtual
nnoremap <leader>pv :!$VIRTUAL_ENV/bin/python %<CR>
" Ejecutar Django server
nnoremap <leader>ds :!python3 manage.py runserver<CR>
" Django migrations
nnoremap <leader>dm :!python3 manage.py makemigrations<CR>
nnoremap <leader>dmi :!python3 manage.py migrate<CR>

" Gestión de entornos virtuales
" Activar entorno virtual myenv
nnoremap <leader>va :call ActivateVenv('./myenv')<CR>
" Activar entorno virtual personalizado
nnoremap <leader>vc :call ActivateVenv(input('Ruta del entorno virtual: '))<CR>
" Mostrar entorno virtual activo
nnoremap <leader>vw :echo 'Entorno virtual activo: ' . $VIRTUAL_ENV<CR>
" Instalar paquetes Python
nnoremap <leader>pi :!pip install 

" ============ JavaScript/React ============
" Ejecutar Node
nnoremap <leader>js :!node %<CR>
" NPM/Yarn comandos
nnoremap <leader>ni :!npm install<CR>
nnoremap <leader>ns :!npm start<CR>
nnoremap <leader>nb :!npm run build<CR>
nnoremap <leader>nt :!npm test<CR>

" ============ PHP ============
" Ejecutar PHP
nnoremap <leader>php :!php %<CR>
" Formatear PHP con clang-format
nnoremap <leader>pf :ClangFormat<CR>

" ============ C++ ============
" Compilar y ejecutar C++
nnoremap <leader>cpp :!g++ % -o %< && ./%<<CR>
" Solo compilar
nnoremap <leader>cc :!g++ % -o %<<CR>
" Formatear C++ con clang-format
nnoremap <leader>cf :ClangFormat<CR>

" ============ Base de Datos (vim-dadbod) ============
" Abrir UI de base de datos
nnoremap <leader>db :DBUIToggle<CR>
" Ejecutar consulta SQL
vnoremap <leader>sq :DB<CR>
nnoremap <leader>sq :.DB<CR>

" ============ Layout de Desarrollo ============
" Layouts predefinidos básicos
nnoremap <leader>dl :call CreateDevLayout()<CR>
nnoremap <leader>la :call AdjustDevLayout()<CR> " Reajustar layout
nnoremap <leader>ds :call CreateSimpleLayout()<CR>
nnoremap <leader>dd :call CreateSideLayout()<CR>
nnoremap <leader>dt :call CreateTripleLayout()<CR>

" Layouts especializados
nnoremap <leader>db :call CreateDebugLayout()<CR>
nnoremap <leader>dv :call CreateReviewLayout()<CR>
nnoremap <leader>dT :call CreateTestLayout()<CR>
nnoremap <leader>dD :call CreateDocsLayout()<CR>
nnoremap <leader>df :call CreateFocusLayout()<CR>
nnoremap <leader>lf :call ExitFocusLayout()<CR>

" ============ Quick Switch System (Alt+F1-F4) ============
" Sistema de acceso rápido a layouts favoritos
let g:quick_layouts = {
    \ 'F1': 'dev',
    \ 'F2': 'debug', 
    \ 'F3': 'test',
    \ 'F4': 'focus'
\ }

" Mapeos para quick switch (cambio a combinaciones que no choquen con el sistema)
nnoremap <leader>q1 :call QuickSwitchLayout('F1')<CR>
nnoremap <leader>q2 :call QuickSwitchLayout('F2')<CR>
nnoremap <leader>q3 :call QuickSwitchLayout('F3')<CR>
nnoremap <leader>q4 :call QuickSwitchLayout('F4')<CR>

" Alternativas adicionales con Ctrl+Alt para usuarios avanzados
nnoremap <C-A-1> :call QuickSwitchLayout('F1')<CR>
nnoremap <C-A-2> :call QuickSwitchLayout('F2')<CR>
nnoremap <C-A-3> :call QuickSwitchLayout('F3')<CR>
nnoremap <C-A-4> :call QuickSwitchLayout('F4')<CR>

" Configurar layouts favoritos personalizados
nnoremap <leader>qc :call ConfigureQuickLayouts()<CR>
nnoremap <leader>qs :call ShowQuickLayoutsInfo()<CR>

" ============ Comandos adicionales para layouts ============
" Información y sugerencias de layout
nnoremap <leader>li :call ShowCurrentLayoutInfo()<CR>
nnoremap <leader>lp :LayoutSuggest<CR>
nnoremap <leader>lS :call SaveLayoutState(input('Nombre del layout: '))<CR>
nnoremap <leader>lL :call LoadLayoutState()<CR>

" Cerrar todas las ventanas del layout y guardar estado
nnoremap <leader>lq :call CloseAllLayoutWindows()<CR>



" Divisiones personalizadas básicas
nnoremap <leader>lh :call SplitHorizontal()<CR>
nnoremap <leader>lv :call SplitVertical()<CR>
nnoremap <leader>lt :call CreateTerminalHere()<CR>

" Sistema de layout personalizable paso a paso
nnoremap <leader>lc :call StartCustomLayout()<CR>
nnoremap <leader>ln :call NextLayoutStep()<CR>
nnoremap <leader>lH :call CustomSplitHorizontal()<CR>
nnoremap <leader>lV :call CustomSplitVertical()<CR>
nnoremap <leader>lT :call CustomTerminal()<CR>
nnoremap <leader>le :call CustomEditor()<CR>
nnoremap <leader>lr :call CustomResize()<CR>
nnoremap <leader>ld :call FinishCustomLayout()<CR>

" Gestión de layouts guardados
nnoremap <leader>ls :call SaveCustomLayout()<CR>
nnoremap <leader>ll :call LoadCustomLayout()<CR>
nnoremap <leader>lm :call ManageCustomLayouts()<CR>

" Navegar entre terminales integrados
nnoremap <leader>t1 :call ToggleTerminal(1)<CR>
nnoremap <leader>t2 :call ToggleTerminal(2)<CR>

" Comandos específicos para desarrollo Django/Python
nnoremap <leader>dr :call DjangoRunServer()<CR>
nnoremap <leader>dx :call RunTests()<CR>
nnoremap <leader>dva :call ActivateVenvInTerminals(input('Ruta del entorno virtual: '))<CR>

" Ejecutar comandos rápidos en terminales
nnoremap <leader>r1 :call RunInTerminal(input('Comando para terminal 1: '), 1)<CR>
nnoremap <leader>r2 :call RunInTerminal(input('Comando para terminal 2: '), 2)<CR>

" Navegación rápida entre ventanas del layout (Alt+números)
nnoremap <A-1> 1<C-W>w  " Primera ventana
nnoremap <A-2> 2<C-W>w  " Segunda ventana
nnoremap <A-3> 3<C-W>w  " Tercera ventana
nnoremap <A-4> 4<C-W>w  " Cuarta ventana

" Navegación entre ventanas (direccional)
nnoremap <leader>1 :wincmd h<CR>  " Ir a ventana izquierda
nnoremap <leader>2 :wincmd l<CR>  " Ir a ventana derecha
nnoremap <leader>3 :wincmd j<CR>  " Ir a ventana inferior
nnoremap <leader>4 :wincmd k<CR>  " Ir a ventana superior

" ============ Warp Terminal Integration ============
" Mapeos específicos para Warp Terminal
if $TERM_PROGRAM ==# 'WarpTerminal' || exists('$WARP_TERMINAL_SESSION_ID')
    " Crear nuevo panel vertical en Warp
    nnoremap <leader>wv :call WarpNewPane('vertical')<CR>
    " Crear nuevo panel horizontal en Warp
    nnoremap <leader>wh :call WarpNewPane('horizontal')<CR>
    " Ejecutar comando en Warp
    nnoremap <leader>wc :call WarpCommand(input('Warp command: '))<CR>
    " Warp AI integration
    nnoremap <leader>wa :call WarpAI(input('Warp AI prompt: '))<CR>
    " Sincronizar tema con Warp
    nnoremap <leader>ws :call WarpThemeSync()<CR>
    " Actualizar estado del proyecto en Warp
    nnoremap <leader>wp :call WarpProjectStatus()<CR>
    
    " Comandos rápidos para desarrollo
    nnoremap <leader>wt :call WarpCommand('npm test')<CR>
    nnoremap <leader>wr :call WarpCommand('npm run dev')<CR>
    nnoremap <leader>wb :call WarpCommand('npm run build')<CR>
endif

" ============ Which-key (Menú de ayuda) ============
" Mostrar menú de atajos
nnoremap <leader>? :WhichKey '<Space>'<CR>
nnoremap <leader>h :WhichKey<CR>
