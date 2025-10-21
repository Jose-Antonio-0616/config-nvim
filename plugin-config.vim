" =====================================================
" plugin-config.vim - Configuración de plugins
" =====================================================

" ============ Tema y Apariencia ============
" Intentar cargar tema hyper, con fallback a default
try
    colorscheme hyper
catch
    " Fallback si hyper no está disponible
    colorscheme default
    " Aplicar algunos colores básicos
    highlight CursorLine ctermbg=235 guibg=#2c2c2c
    highlight LineNr ctermfg=grey guifg=#5c6370
endtry

set background=dark
highlight CursorLine guibg=#0f0f0f guifg=NONE

" Configuración de Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Mostrar entorno virtual en statusline
let g:airline#extensions#virtualenv#enabled = 1
function! AirlineInit()
    let g:airline_section_b = airline#section#create(['hunks', 'branch'])
    let g:airline_section_x = airline#section#create_right(['%{CurrentLayoutStatusline()}', '%{VirtualEnvStatusline()}', 'filetype'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

" Configuración de vim-devicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

" Configuración de nvim-web-devicons
if has('nvim-0.5')
    lua << EOF
require'nvim-web-devicons'.setup {
  override = {}, 
  default = true,
  strict = true,
  override_by_filename = {
    [".gitignore"] = {
      icon = "󰆘",
      color = "#f1502f",
      name = "Gitignore"
    }
  },
  override_by_extension = {
    ["py"] = {
      icon = "󰽿",
      color = "#3776ab",
      name = "Python"
    },
    ["js"] = {
      icon = "󰧊",
      color = "#f7df1e",
      name = "JavaScript"
    },
    ["html"] = {
      icon = "󰈓",
      color = "#e34c26",
      name = "HTML"
    },
    ["css"] = {
      icon = "󰪑",
      color = "#1572b6",
      name = "CSS"
    },
    ["php"] = {
      icon = "󰈠",
      color = "#777bb4",
      name = "PHP"
    },
    ["cpp"] = {
      icon = "󰧍",
      color = "#00599c",
      name = "CPP"
    }
  }
}
EOF
endif

" ============ NERDTree ============
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 30
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeQuitOnOpen = 1

" ============ FZF ============
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" ============ EASYMOTION ==========
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0

" ============ Tagbar ============
let g:tagbar_width = 30
let g:tagbar_compact = 1
let g:tagbar_sort = 0

" ============ GitGutter ============
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_highlight_linenrs = 1

" ============ ALE (Linting) ============
" ALE deshabilitado - usando CoC.nvim para linting y LSP

" ============ Rainbow brackets ============
let g:rainbow_active = 1

" ============ CoC.nvim ============
" Tiempo de actualización más rápido
set updatetime=300

" No mostrar mensajes de inserción
set shortmess+=c

" Función auxiliar para verificar espacios
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" === CONFIGURACIÓN SIMPLE Y DIRECTA PARA COC ===
" Esta configuración funciona de forma universal

" Tab: navegar hacia abajo en el menú de autocompletado
inoremap <silent><expr> <TAB> 
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Shift+Tab: navegar hacia arriba en el menú
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" === SOLUCIÓN ALTERNATIVA PARA ENTER ===
" En lugar de mapear Enter directamente, usar Ctrl+Y que es más confiable
inoremap <silent><expr> <C-y> coc#pum#visible() ? coc#pum#confirm() : "\<C-y>"

" Enter - configuración más conservadora que siempre funciona
inoremap <silent><expr> <CR> 
      \ coc#pum#visible() ? <SID>coc_confirm_smart() : "\<CR>"

" Función auxiliar para confirmar de forma inteligente
function! s:coc_confirm_smart() abort
  " Si hay una opción seleccionada, confirmarla
  if coc#pum#visible()
    " Intentar confirmar con la API moderna
    if exists('*coc#pum#confirm')
      return coc#pum#confirm()
    endif
  endif
  " Si no hay menú visible, comportamiento normal de Enter
  return "\<CR>"
endfunction

" Función auxiliar para verificar si hay cambios en completado
function! s:has_completion_changed()
  return pumvisible() && !empty(v:completed_item)
endfunction

" Función de diagnóstico para Enter en autocompletado
function! s:coc_confirm_completion()
  " Verificar que tenemos una API de CoC disponible
  if exists('*coc#pum#visible')
    if coc#pum#visible()
      return coc#pum#confirm()
    endif
  elseif pumvisible()
    return "\<C-y>"
  endif
  return "\<CR>"
endfunction

" Función de diagnóstico para verificar estado del autocompletado
function! DiagnoseCocCompletion()
  echo '🔧 Diagnóstico de CoC Autocompletado:'
  echo ''
  
  " Verificar CoC está corriendo
  if !exists('*coc#status')
    echo '❌ CoC no está disponible'
    return
  endif
  
  echo '✅ CoC está disponible'
  echo '📊 Estado: ' . coc#status()
  
  " Verificar API moderna
  if exists('*coc#pum#visible')
    echo '✅ API moderna disponible (coc#pum#*)'
    echo '🔍 PUM visible: ' . (coc#pum#visible() ? 'Sí' : 'No')
  else
    echo '⚠️  Usando API clásica (pumvisible)'
    echo '🔍 PUM visible: ' . (pumvisible() ? 'Sí' : 'No')
  endif
  
  " Verificar configuraciones clave
  echo ''
  echo '⚙️  Configuraciones relevantes:'
  echo 'updatetime: ' . &updatetime
  echo 'completeopt: ' . &completeopt
  echo 'shortmess: ' . &shortmess
  
  " Verificar extensiones CoC
  if exists('*CocAction')
    let extensions = CocAction('extensionStats')
    echo 'Extensiones activas: ' . len(extensions)
  endif
endfunction

" Comando para diagnóstico
command! CocDiagnose call DiagnoseCocCompletion()

" Ctrl+Space para activar manualmente el autocompletado
inoremap <silent><expr> <C-Space> coc#refresh()

" ============ UndoTree ============
if has("persistent_undo")
   let target_path = expand('~/.local/share/nvim/undodir')
   if !isdirectory(target_path)
       call mkdir(target_path, "p", 0700)
   endif
   let &undodir=target_path
   set undofile
endif

" ============ Auto-pairs ============
let g:AutoPairsShortcutToggle = '<M-p>'

" ============ Commentary ============
autocmd FileType apache setlocal commentstring=#\ %s

" ============ Treesitter ============
" Configuración completa de Treesitter para todo el stack
if has('nvim-0.5')
    lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    -- Lenguajes del stack (solo parsers verificados)
    "python",
    "html", "css", "javascript", "typescript", "tsx",
    "php", "cpp", "c", "sql",
    -- Utilidades
    "lua", "vim", "vimdoc", "query", "json", "yaml",
    "bash", "markdown", "comment"
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  textobjects = {
    enable = true,
  },
}
EOF
endif

" ============ VimWiki ============
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0

" ============ Python y Django ============
" Sintaxis mejorada de Python
let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0

" PEP8 indentación
let g:python_pep8_indent_multiline_string = 0

" Configuración de entornos virtuales
" Detectar automáticamente el entorno virtual
function! DetectVirtualEnv()
    " Buscar entornos virtuales comunes
    let venv_paths = [
        \ './myenv/bin/python',
        \ './venv/bin/python',
        \ './env/bin/python',
        \ './.venv/bin/python',
        \ './virtualenv/bin/python'
    \ ]
    
    " Si VIRTUAL_ENV está definido, usarlo
    if !empty($VIRTUAL_ENV)
        let python_path = $VIRTUAL_ENV . '/bin/python'
        if executable(python_path)
            let g:python3_host_prog = python_path
            return python_path
        endif
    endif
    
    " Buscar en directorios comunes
    for venv_path in venv_paths
        if executable(venv_path)
            let g:python3_host_prog = fnamemodify(venv_path, ':p')
            return fnamemodify(venv_path, ':p')
        endif
    endfor
    
    " Fallback a python3 del sistema
    if executable('python3')
        let g:python3_host_prog = exepath('python3')
        return exepath('python3')
    endif
    
    return ''
endfunction

" Configurar el intérprete de Python al abrir archivos Python
autocmd FileType python call DetectVirtualEnv()

" Función para activar entorno virtual manualmente
function! ActivateVenv(venv_path)
    if isdirectory(a:venv_path)
        let python_path = a:venv_path . '/bin/python'
        if executable(python_path)
            let g:python3_host_prog = fnamemodify(python_path, ':p')
            let $VIRTUAL_ENV = fnamemodify(a:venv_path, ':p')
            let $PATH = fnamemodify(a:venv_path, ':p') . '/bin:' . $PATH
            echo 'Entorno virtual activado: ' . a:venv_path
            " Reiniciar CoC para usar el nuevo Python
            if exists(':CocRestart')
                CocRestart
            endif
        else
            echo 'No se encontró Python en: ' . python_path
        endif
    else
        echo 'Directorio no encontrado: ' . a:venv_path
    endif
endfunction

" Django
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType htmldjango setlocal omnifunc=htmlcomplete#CompleteTags

" Mostrar el entorno virtual activo en la statusline
function! VirtualEnvStatusline()
    if !empty($VIRTUAL_ENV)
        return '[' . fnamemodify($VIRTUAL_ENV, ':t') . ']'
    endif
    return ''
endfunction

" ============ Indicadores Visuales de Layout ============
" Función para mostrar layout actual en statusline
function! CurrentLayoutStatusline()
    let layout_name = get(g:current_layout_info, 'name', 'basic')
    let layout_type = get(g:current_layout_info, 'type', 'basic')
    let windows_count = winnr('$')
    
    " Iconos por tipo de layout
    let layout_icons = {
        \ 'dev': '🔧',
        \ 'debug': '🐛',
        \ 'test': '🧪',
        \ 'review': '👀',
        \ 'docs': '📚',
        \ 'focus': '🎯',
        \ 'simple': '📄',
        \ 'triple': '📐',
        \ 'basic': '⚡',
        \ 'custom': '🎨'
    \ }
    
    let icon = get(layout_icons, layout_type, '📋')
    
    if windows_count > 1
        return icon . ' ' . layout_type . '(' . windows_count . 'w)'
    else
        return icon . ' ' . layout_type
    endif
endfunction

" Función para mostrar información detallada del layout
function! ShowCurrentLayoutInfo()
    let info = g:current_layout_info
    
    echo '📊 Información del Layout Actual:'
    echo ''
    echo '📌 Nombre: ' . get(info, 'name', 'Sin nombre')
    echo '🏷️  Tipo: ' . get(info, 'type', 'basic')
    echo '🪟 Ventanas: ' . winnr('$')
    echo '💻 Terminales activos: ' . len(get(g:, 'custom_terminals', {}))
    
    if has_key(info, 'timestamp') && info.timestamp > 0
        echo '⏰ Última actualización: ' . strftime('%Y-%m-%d %H:%M:%S', info.timestamp)
    endif
    
    if has_key(info, 'last_files') && !empty(info.last_files)
        echo '📂 Archivos en sesión: ' . len(info.last_files)
        for file in info.last_files[:2]
            echo '   • ' . fnamemodify(file, ':t')
        endfor
        if len(info.last_files) > 3
            echo '   • ... y ' . (len(info.last_files) - 3) . ' más'
        endif
    endif
    
    echo ''
    echo 'Comando: :LayoutInfo para ver esta información'
endfunction

" Comando para mostrar información del layout
command! LayoutInfo call ShowCurrentLayoutInfo()

" Función para resaltar layout activo con colores
function! HighlightCurrentLayout()
    let layout_type = get(g:current_layout_info, 'type', 'basic')
    
    " Definir colores por tipo de layout
    let layout_colors = {
        \ 'dev': 'ctermfg=green guifg=#50fa7b',
        \ 'debug': 'ctermfg=red guifg=#ff5555', 
        \ 'test': 'ctermfg=yellow guifg=#f1fa8c',
        \ 'review': 'ctermfg=blue guifg=#8be9fd',
        \ 'docs': 'ctermfg=magenta guifg=#ff79c6',
        \ 'focus': 'ctermfg=cyan guifg=#50fa7b',
        \ 'simple': 'ctermfg=white guifg=#f8f8f2',
        \ 'triple': 'ctermfg=yellow guifg=#ffb86c',
        \ 'basic': 'ctermfg=gray guifg=#6272a4',
        \ 'custom': 'ctermfg=magenta guifg=#bd93f9'
    \ }
    
    let color = get(layout_colors, layout_type, 'ctermfg=white guifg=#f8f8f2')
    
    " Crear highlight group dinámico
    execute 'highlight LayoutIndicator ' . color . ' cterm=bold gui=bold'
    
    " Flash temporal para mostrar cambio de layout
    if exists('g:layout_just_changed') && g:layout_just_changed
        execute 'highlight LayoutIndicator ctermbg=white guibg=#ffffff ctermfg=black guifg=#000000 cterm=bold gui=bold'
        let g:layout_just_changed = 0
        
        " Restaurar color normal después de 1 segundo
        call timer_start(1000, {-> execute('highlight LayoutIndicator ' . color . ' cterm=bold gui=bold')})
    endif
endfunction

" ============ Integración con Warp Terminal ============
" Funciones específicas para Warp Terminal
if $TERM_PROGRAM ==# 'WarpTerminal' || exists('$WARP_TERMINAL_SESSION_ID')
    " Función para enviar comandos a Warp
    function! WarpCommand(cmd)
        " Usar Warp's command palette integration
        if executable('warp')
            call system('warp --command "' . a:cmd . '"')
        else
            " Fallback a ejecución normal
            execute '!' . a:cmd
        endif
    endfunction
    
    " Función para crear un nuevo panel en Warp
    function! WarpNewPane(direction)
        if a:direction ==# 'vertical'
            call system('warp --new-pane --direction right')
        elseif a:direction ==# 'horizontal'
            call system('warp --new-pane --direction down')
        endif
    endfunction
    
    " Función para integración con Warp AI
    function! WarpAI(prompt)
        if exists('$WARP_AI_ENABLED')
            call system('warp --ai "' . a:prompt . '"')
        else
            echo 'Warp AI no está habilitado'
        endif
    endfunction
    
    " Función para optimizar el tema con Warp
    function! WarpThemeSync()
        " Detectar si Warp está en modo oscuro o claro
        if exists('$WARP_THEME_MODE')
            if $WARP_THEME_MODE ==# 'dark'
                set background=dark
            else
                set background=light
            endif
        endif
    endfunction
    
    " Auto-sincronizar tema con Warp
    autocmd VimEnter * call WarpThemeSync()
    
    " Función para mostrar estado del proyecto en Warp
    function! WarpProjectStatus()
        let project_name = fnamemodify(getcwd(), ':t')
        let git_branch = system('git branch --show-current 2>/dev/null | tr -d "\n"')
        let venv_name = !empty($VIRTUAL_ENV) ? '[' . fnamemodify($VIRTUAL_ENV, ':t') . ']' : ''
        
        let status = project_name
        if !empty(git_branch)
            let status .= ' 󰆕 ' . git_branch
        endif
        if !empty(venv_name)
            let status .= ' 🐍 ' . venv_name
        endif
        
        " Enviar estado a Warp
        if executable('warp-status')
            call system('warp-status "' . status . '"')
        endif
    endfunction
    
    " Actualizar estado del proyecto automáticamente
    autocmd DirChanged,BufEnter * call WarpProjectStatus()
endif

" ============ Layout de Trabajo (Terminales Integrados) ============
" Configuración para simular el flujo de trabajo con tabs de terminal

" ============ Sistema de Persistencia de Layouts ============
" Variables globales para el estado del layout
let g:layout_state_file = expand('~/.config/nvim/layout_state.json')
let g:current_layout_info = {
    \ 'name': 'default',
    \ 'type': 'basic',
    \ 'windows': 1,
    \ 'terminals': {},
    \ 'terminal_commands': {},
    \ 'last_files': [],
    \ 'timestamp': 0
\ }

" Función para guardar el estado actual del layout
function! SaveLayoutState(layout_name)
    let current_state = {
        \ 'name': a:layout_name,
        \ 'type': get(g:, 'current_layout_type', 'custom'),
        \ 'windows': winnr('$'),
        \ 'terminals': copy(get(g:, 'custom_terminals', {})),
        \ 'terminal_commands': {},
        \ 'last_files': [],
        \ 'working_directory': getcwd(),
        \ 'timestamp': localtime()
    \ }
    
    " Recopilar archivos abiertos
    for i in range(1, bufnr('$'))
        if buflisted(i) && !empty(bufname(i)) && bufname(i) !~ 'term://'
            call add(current_state.last_files, bufname(i))
        endif
    endfor
    
    " Recopilar comandos activos en terminales
    for [term_id, buf_nr] in items(current_state.terminals)
        if bufexists(buf_nr)
            let current_state.terminal_commands[term_id] = getbufvar(buf_nr, 'last_command', '')
        endif
    endfor
    
    let g:current_layout_info = current_state
    
    " Guardar a archivo JSON
    try
        call writefile([json_encode(current_state)], g:layout_state_file)
        echo '💾 Estado del layout "' . a:layout_name . '" guardado'
    catch
        echo '❌ Error guardando estado del layout'
    endtry
endfunction



" Función para auto-guardado al salir
function! AutoSaveLayoutState()
    if g:custom_layout_active || winnr('$') > 1
        call SaveLayoutState('auto_save_' . strftime('%Y%m%d_%H%M'))
    endif
endfunction

" Función para crear el layout específico del usuario:
" 1. Mitad izquierda vertical para código
" 2. Mitad derecha dividida en 3:
"    - Superior horizontal para código (70%)
"    - Inferior dividida en 2 terminales horizontales (30%)
function! CreateDevLayout()
    " Limpiar todas las ventanas excepto la actual
    only
    " NERDTree
    wincmd h

    " Crear división vertical principal (50% izquierda / 50% derecha)
    vsplit

    " Dividir la parte derecha horizontalmente (superior e inferior)
    split
    
    " Dividir la parte inferior en dos terminales verticalmente
    vsplit
    
    " Crear terminal en la parte inferior derecha (terminal 2)
    terminal
    let g:dev_terminal_2 = bufnr('%')
    
    " Moverse a la parte inferior izquierda y crear otra terminal (terminal 1)
    wincmd h
    terminal
    let g:dev_terminal_1 = bufnr('%')

    " Ajustar proporciones de ventanas
    wincmd h
    let total_width = winwidth(0) + winwidth(winnr('l'))
    execute 'vertical resize' . (total_width / 2)
    wincmd l
    let right_pane_height = winheight(0) + winheight(winnr('j'))
    execute 'resize' . (right_pane_height * 70 / 100)
    wincmd j
    let term_width = winwidth(0) + winwidth(winnr('l'))
    execute 'vertical resize' . (term_width / 2)

    " Configurar variables del layout actual
    let g:current_layout_info = {
        \ 'name': 'dev_layout',
        \ 'type': 'dev',
        \ 'windows': winnr('$'),
        \ 'terminals': {'term1': g:dev_terminal_1, 'term2': g:dev_terminal_2},
        \ 'timestamp': localtime()
    \ }

    wincmd h
    stopinsert

    echo '🔧 Layout Dev creado: código principal (izq.) + código sec. (arr. der.) + 2 terminales (ab. der.)'
    echo '💡 Usa Space+t1/Space+t2 para alternar entre terminales'
endfunction

" Funcion para reajustar DevLayout
function! AdjustDevLayout()
    " Ajustar proporciones de ventanas
    wincmd h
    let total_width = winwidth(0) + winwidth(winnr('l'))
    execute 'vertical resize' . (total_width / 2)
    wincmd l
    let right_pane_height = winheight(0) + winheight(winnr('j'))
    execute 'resize' . (right_pane_height * 70 / 100)
    wincmd j
    let term_width = winwidth(0) + winwidth(winnr('l'))
    execute 'vertical resize' . (term_width / 2)

    " Dejar el cursor en la ventana principal y en modo 'normal'
    wincmd h
    stopinsert
endfunction

" Funciones de layout predefinidos flexibles
function! CreateSimpleLayout()
    " Layout simple: editor + terminal inferior
    only
    split
    resize 10
    terminal
    let g:dev_terminal_1 = bufnr('%')
    wincmd k
    echo 'Layout simple creado: editor + terminal inferior'
endfunction

function! CreateSideLayout()
    " Layout lateral: editor + terminal lateral
    only
    vsplit
    vertical resize 80
    terminal
    let g:dev_terminal_1 = bufnr('%')
    wincmd h
    echo 'Layout lateral creado: editor + terminal lateral'
endfunction

function! CreateTripleLayout()
    " Layout triple: editor + 2 terminales (uno inferior, uno lateral)
    only
    
    " Terminal inferior
    split
    resize 10
    terminal
    let g:dev_terminal_1 = bufnr('%')
    
    " Volver al editor
    wincmd k
    
    " Terminal lateral
    vsplit
    vertical resize 80
    terminal
    let g:dev_terminal_2 = bufnr('%')
    
    " Volver al editor principal
    wincmd h
    
    " Configurar layout info
    let g:current_layout_type = 'triple'
    call SaveLayoutState('triple_layout')
    
    echo 'Layout triple creado: editor + terminal inferior + terminal lateral'
endfunction

" ============ Layouts Especializados ============

" Layout para Debugging - División en 4 cuadrantes
function! CreateDebugLayout()
    only
    let g:current_layout_type = 'debug'
    
    " Crear cuadrante principal para código (izquierda)
    vsplit
    
    " Moverse a la derecha para crear panel de debugging
    wincmd l
    " Crear ventana superior derecha (variables/watch)
    split
    
    " Configurar ventana de variables
    enew
    setlocal buftype=nofile
    setlocal bufhidden=wipe
    setlocal noswapfile
    file [DEBUG-VARS]
    put ='🔍 Variables de Debug:'
    put =''
    put ='Usa gd para ir a definición'
    put ='Usa K para documentación'
    put =''
    wincmd k
    
    " Moverse a ventana inferior derecha (stack/breakpoints)
    wincmd j
    split
    
    " Configurar ventana de stack
    wincmd j
    enew
    setlocal buftype=nofile
    setlocal bufhidden=wipe
    setlocal noswapfile
    file [DEBUG-STACK]
    put ='📚 Call Stack:'
    put =''
    put ='Stack trace aparecerá aquí'
    put =''
    
    " Configurar ventana de breakpoints
    wincmd k
    enew
    setlocal buftype=nofile
    setlocal bufhidden=wipe
    setlocal noswapfile
    file [BREAKPOINTS]
    put ='🔴 Breakpoints:'
    put =''
    put ='Lista de breakpoints activos'
    put =''
    
    " Terminal de debug en la parte inferior
    wincmd j
    split
    resize 8
    terminal
    let g:debug_terminal = bufnr('%')
    
    " Volver al editor principal
    wincmd h
    wincmd k
    
    " Ajustar tamaños
    vertical resize 80
    
    call SaveLayoutState('debug_layout')
    echo '🐛 Layout Debug creado: código + variables + stack + breakpoints + terminal'
endfunction

" Layout para Code Review - Vista diff lado a lado
function! CreateReviewLayout()
    only
    let g:current_layout_type = 'review'
    
    " Crear división vertical para diff
    vsplit
    
    " Terminal inferior para comandos git
    split
    resize 10
    terminal
    let g:review_terminal = bufnr('%')
    
    " Configurar terminal con comandos git útiles
    if exists('g:review_terminal')
        let job_id = getbufvar(g:review_terminal, '&channel')
        if job_id > 0
            call chansend(job_id, "echo '🔍 Git Review Commands:'\r")
            call chansend(job_id, "echo 'git diff HEAD~1'\r")
            call chansend(job_id, "echo 'git log --oneline -10'\r")
            call chansend(job_id, "echo 'git status'\r")
        endif
    endif
    
    " Volver a la ventana superior izquierda
    wincmd k
    
    " Crear ventana de información del commit
    wincmd l
    split
    resize 8
    enew
    setlocal buftype=nofile
    setlocal bufhidden=wipe
    setlocal noswapfile
    file [COMMIT-INFO]
    put ='📝 Información del Commit:'
    put =''
    put ='Autor: '
    put ='Fecha: '
    put ='Mensaje: '
    put ='Files changed: '
    put =''
    
    " Ventana principal derecha para archivo modificado
    wincmd j
    
    " Volver al editor izquierdo (archivo original)
    wincmd h
    
    call SaveLayoutState('review_layout')
    echo '👀 Layout Review creado: original + modificado + info + terminal git'
endfunction

" Layout para Testing - Código + Tests + Resultados
function! CreateTestLayout()
    only
    let g:current_layout_type = 'testing'
    
    " División vertical principal (código | tests)
    vsplit
    
    " Panel derecho para tests
    wincmd l
    
    " División horizontal en panel derecho (tests | resultados)
    split
    
    " Ventana inferior derecha para resultados de tests
    wincmd j
    enew
    setlocal buftype=nofile
    setlocal bufhidden=wipe
    setlocal noswapfile
    file [TEST-RESULTS]
    put ='🧪 Resultados de Tests:'
    put =''
    put ='Ejecuta tests con <Space>tx'
    put =''
    
    " Terminal para ejecutar tests
    split
    resize 10
    terminal
    let g:test_terminal = bufnr('%')
    
    " Configurar terminal de tests
    if exists('g:test_terminal')
        let job_id = getbufvar(g:test_terminal, '&channel')
        if job_id > 0
            call chansend(job_id, "echo '🧪 Terminal de Tests:'\r")
            call chansend(job_id, "echo 'pytest -v'\r")
            call chansend(job_id, "echo 'npm test'\r")
        endif
    endif
    
    " Volver al panel de tests
    wincmd k
    
    " Intentar abrir archivo de test si existe
    let test_files = ['test_*.py', '*_test.py', '*.test.js', '*_test.js']
    for pattern in test_files
        let found_files = glob(pattern)
        if !empty(found_files)
            execute 'edit ' . split(found_files, "\n")[0]
            break
        endif
    endfor
    
    " Si no se encontró archivo de test, crear uno nuevo
    if empty(expand('%'))
        enew
        setlocal filetype=python
        file test_new.py
        put ='# 🧪 Archivo de Tests'
        put ='import unittest'
        put =''
        put ='class TestCase(unittest.TestCase):'
        put ='    def test_example(self):'
        put ='        self.assertTrue(True)'
        1delete
    endif
    
    " Volver al editor principal (código)
    wincmd h
    
    call SaveLayoutState('test_layout')
    echo '🧪 Layout Testing creado: código + tests + resultados + terminal'
endfunction

" Layout para Documentación - Editor + Preview + Referencias
function! CreateDocsLayout()
    only
    let g:current_layout_type = 'docs'
    
    " División vertical principal
    vsplit
    
    " Panel derecho para preview/referencias
    wincmd l
    
    " División horizontal en panel derecho
    split
    
    " Ventana superior derecha - Preview de markdown
    wincmd k
    enew
    setlocal buftype=nofile
    setlocal bufhidden=wipe
    setlocal noswapfile
    file [MARKDOWN-PREVIEW]
    put ='📖 Preview de Markdown:'
    put =''
    put ='El contenido aparecerá aquí'
    put ='Usa :MarkdownPreview si tienes el plugin'
    put =''
    
    " Ventana inferior derecha - Referencias y TOC
    wincmd j
    enew
    setlocal buftype=nofile
    setlocal bufhidden=wipe
    setlocal noswapfile
    file [REFERENCES]
    put ='📚 Referencias y Enlaces:'
    put =''
    put ='• README.md'
    put ='• docs/'
    put ='• CHANGELOG.md'
    put ='• TODO.md'
    put =''
    put ='🔗 Enlaces útiles:'
    put ='• Documentación oficial'
    put ='• Stack Overflow'
    put ='• GitHub Issues'
    put =''
    
    " Terminal para comandos de documentación
    split
    resize 8
    terminal
    let g:docs_terminal = bufnr('%')
    
    if exists('g:docs_terminal')
        let job_id = getbufvar(g:docs_terminal, '&channel')
        if job_id > 0
            call chansend(job_id, "echo '📚 Comandos de Documentación:'\r")
            call chansend(job_id, "echo 'grip README.md  # Preview GitHub'\r")
            call chansend(job_id, "echo 'mkdocs serve   # MkDocs preview'\r")
        endif
    endif
    
    " Volver al editor principal
    wincmd h
    
    " Intentar abrir README o crear nuevo archivo markdown
    if filereadable('README.md')
        edit README.md
    elseif filereadable('README.rst')
        edit README.rst
    else
        enew
        setlocal filetype=markdown
        file documentation.md
        put ='# 📖 Documentación'
        put =''
        put ='## Descripción'
        put =''
        put ='## Instalación'
        put =''
        put ='## Uso'
        put =''
        put ='## Contribuir'
        put =''
        1delete
    endif
    
    call SaveLayoutState('docs_layout')
    echo '📚 Layout Documentación creado: editor + preview + referencias + terminal'
endfunction

" Layout para Full-Screen Focus - Una sola ventana maximizada
function! CreateFocusLayout()
    only
    let g:current_layout_type = 'focus'
    
    " Configurar entorno de concentración
    set laststatus=0  " Ocultar statusline
    set nonumber      " Ocultar números
    set norelativenumber
    set signcolumn=no " Ocultar columna de signos
    
    " Mensaje temporal
    echo '🎯 Modo Focus activado. <Space>lf para volver al layout normal'
    
    call SaveLayoutState('focus_layout')
endfunction

" Función para salir del modo focus
function! ExitFocusLayout()
    set laststatus=2     " Mostrar statusline
    set number           " Mostrar números
    set relativenumber   " Números relativos
    set signcolumn=yes   " Mostrar columna de signos
    
    echo '🎯 Modo Focus desactivado'
endfunction

" Función para crear divisiones personalizadas
function! SplitHorizontal()
    split
    echo 'División horizontal creada'
endfunction

function! SplitVertical()
    vsplit
    echo 'División vertical creada'
endfunction

function! CreateTerminalHere()
    terminal
    echo 'Terminal creado en ventana actual'
endfunction

" ============ Sistema de Layout Personalizable ============
" Variables globales para tracking del layout personalizado
let g:custom_layout_step = 0
let g:custom_terminals = {}
let g:custom_layout_active = 0

" Función para iniciar creación de layout personalizado
function! StartCustomLayout()
    only
    let g:custom_layout_step = 0
    let g:custom_terminals = {}
    let g:custom_layout_active = 1
    echo '🎨 Layout personalizado iniciado. Usa <Space>ln para siguiente paso'
    echo '📋 Pasos disponibles: split-h, split-v, terminal, edit, resize, done'
endfunction

" Función para navegación paso a paso en layout personalizado
function! NextLayoutStep()
    if !g:custom_layout_active
        echo '⚠️  Inicia un layout personalizado primero con <Space>lc'
        return
    endif
    
    let g:custom_layout_step += 1
    
    echo '📐 Paso ' . g:custom_layout_step . ' - ¿Qué quieres hacer?'
    echo '1. h  → División horizontal'
    echo '2. v  → División vertical'
    echo '3. t  → Terminal aquí'
    echo '4. e  → Editor aquí'
    echo '5. r  → Redimensionar'
    echo '6. d  → Terminar layout'
    echo ''
    echo 'Usa: <Space>l + opción (ej: <Space>lh para horizontal)'
endfunction

" Funciones específicas del layout personalizado
function! CustomSplitHorizontal()
    if !g:custom_layout_active
        call StartCustomLayout()
    endif
    split
    echo '➖ División horizontal creada (Paso ' . g:custom_layout_step . ')'
    echo 'Próximo: <Space>ln para ver opciones'
endfunction

function! CustomSplitVertical()
    if !g:custom_layout_active
        call StartCustomLayout()
    endif
    vsplit
    echo '➗ División vertical creada (Paso ' . g:custom_layout_step . ')'
    echo 'Próximo: <Space>ln para ver opciones'
endfunction

function! CustomTerminal()
    if !g:custom_layout_active
        call StartCustomLayout()
    endif
    
    terminal
    let terminal_id = 'custom_' . winnr()
    let g:custom_terminals[terminal_id] = bufnr('%')
    
    echo '💻 Terminal creado (ID: ' . terminal_id . ')'
    echo 'Próximo: <Space>ln para ver opciones'
endfunction

function! CustomEditor()
    if !g:custom_layout_active
        call StartCustomLayout()
    endif
    
    " Si hay archivos recientes, abrirlos, sino crear nuevo
    if argc() > 0
        edit
    else
        enew
    endif
    
    echo '📝 Editor preparado en ventana actual'
    echo 'Próximo: <Space>ln para ver opciones'
endfunction

function! CustomResize()
    if !g:custom_layout_active
        echo '⚠️  No hay layout personalizado activo'
        return
    endif
    
    echo '📏 Modo redimensionamiento:'
    echo '• Ctrl+Flechas para redimensionar'
    echo '• O especifica:'
    
    let choice = input('Redimensionar (w)idth, (h)eight, o (c)ancelar: ')
    
    if choice ==# 'w'
        let width = input('Ancho (columnas): ')
        if width != ''
            execute 'vertical resize ' . width
        endif
    elseif choice ==# 'h'
        let height = input('Alto (líneas): ')
        if height != ''
            execute 'resize ' . height
        endif
    endif
    
    echo 'Redimensionamiento aplicado. <Space>ln para continuar'
endfunction

function! FinishCustomLayout()
    let g:custom_layout_active = 0
    let g:custom_layout_step = 0
    
    echo '✅ Layout personalizado completado!'
    echo '🎯 Terminales creados: ' . string(keys(g:custom_terminals))
    echo '📊 Ventanas totales: ' . winnr('$')
    echo ''
    echo '💡 Tip: Guarda este layout con :mksession mi_layout.vim'
endfunction

" Función para guardar layout personalizado
function! SaveCustomLayout()
    let layout_name = input('Nombre para este layout: ')
    if layout_name != ''
        let session_file = '~/.config/nvim/layouts/' . layout_name . '.vim'
        
        " Crear directorio si no existe
        if !isdirectory(expand('~/.config/nvim/layouts'))
            call mkdir(expand('~/.config/nvim/layouts'), 'p')
        endif
        
        execute 'mksession! ' . session_file
        echo '💾 Layout guardado como: ' . session_file
        echo '🔄 Cargar con: <Space>ll → ' . layout_name
    endif
endfunction

" Función para cargar layouts guardados
function! LoadCustomLayout()
    let layouts_dir = expand('~/.config/nvim/layouts')
    
    if !isdirectory(layouts_dir)
        echo '📁 No hay layouts guardados aún'
        return
    endif
    
    let layout_files = split(globpath(layouts_dir, '*.vim'), "\n")
    
    if empty(layout_files)
        echo '📁 No hay layouts guardados'
        return
    endif
    
    echo '📂 Layouts disponibles:'
    let i = 1
    let layout_map = {}
    for file in layout_files
        let name = fnamemodify(file, ':t:r')
        echo i . '. ' . name
        let layout_map[string(i)] = file
        let i += 1
    endfor
    
    let choice = input('Selecciona layout (número): ')
    
    if has_key(layout_map, choice)
        execute 'source ' . layout_map[choice]
        echo '🎨 Layout "' . fnamemodify(layout_map[choice], ':t:r') . '" cargado'
    else
        echo '❌ Selección inválida'
    endif
endfunction

" Función para listar y gestionar layouts guardados
function! ManageCustomLayouts()
    let layouts_dir = expand('~/.config/nvim/layouts')
    
    if !isdirectory(layouts_dir)
        echo '📁 No hay layouts guardados'
        return
    endif
    
    let layout_files = split(globpath(layouts_dir, '*.vim'), "\n")
    
    if empty(layout_files)
        echo '📁 No hay layouts guardados'
        return
    endif
    
    echo '🗂️  Gestión de Layouts:'
    echo ''
    
    let i = 1
    for file in layout_files
        let name = fnamemodify(file, ':t:r')
        let size = getfsize(file)
        echo i . '. ' . name . ' (' . size . ' bytes)'
        let i += 1
    endfor
    
    echo ''
    echo 'Comandos disponibles:'
    echo '• <Space>ll  → Cargar layout'
    echo '• <Space>ls  → Guardar layout actual'
    echo '• <Space>ld  → Eliminar layout (próximamente)'
endfunction

" Función para alternar entre terminales
function! ToggleTerminal(terminal_num)
    if a:terminal_num == 1
        " Terminal inferior
        if exists('g:dev_terminal_1')
            let win_id = bufwinnr(g:dev_terminal_1)
            if win_id > 0
                execute win_id . 'wincmd w'
            else
                split
                resize 10
                execute 'buffer ' . g:dev_terminal_1
            endif
        else
            split
            resize 10
            terminal
            let g:dev_terminal_1 = bufnr('%')
        endif
    elseif a:terminal_num == 2
        " Terminal lateral
        if exists('g:dev_terminal_2')
            let win_id = bufwinnr(g:dev_terminal_2)
            if win_id > 0
                execute win_id . 'wincmd w'
            else
                vsplit
                vertical resize 80
                execute 'buffer ' . g:dev_terminal_2
            endif
        else
            vsplit
            vertical resize 80
            terminal
            let g:dev_terminal_2 = bufnr('%')
        endif
    endif
endfunction

" Función para ejecutar comando en terminal específico
function! RunInTerminal(cmd, terminal_num)
    if a:terminal_num == 1 && exists('g:dev_terminal_1')
        let job_id = getbufvar(g:dev_terminal_1, '&channel')
        if job_id > 0
            call chansend(job_id, a:cmd . "\r")
        endif
    elseif a:terminal_num == 2 && exists('g:dev_terminal_2')
        let job_id = getbufvar(g:dev_terminal_2, '&channel')
        if job_id > 0
            call chansend(job_id, a:cmd . "\r")
        endif
    endif
endfunction

" Función para Django runserver en terminal dedicado
function! DjangoRunServer()
    call RunInTerminal('python manage.py runserver', 1)
    echo 'Django server iniciado en terminal inferior'
endfunction

" Función para ejecutar tests en terminal lateral
function! RunTests()
    call RunInTerminal('python -m pytest -v', 2)
    echo 'Tests ejecutándose en terminal lateral'
endfunction

" Función para activar entorno virtual en ambos terminales
function! ActivateVenvInTerminals(venv_path)
    let activate_cmd = 'source ' . a:venv_path . '/bin/activate'
    call RunInTerminal(activate_cmd, 1)
    call RunInTerminal(activate_cmd, 2)
    echo 'Entorno virtual activado en ambos terminales'
endfunction

" Auto-comandos para configurar terminales
augroup DevLayout
    autocmd!
    " Configurar terminal cuando se abre
    autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no
    " Hacer que Esc funcione normalmente en terminal
    autocmd TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
    " Volver automáticamente al modo insert en terminal
    autocmd BufWinEnter,WinEnter term://* startinsert
augroup END

" ============ Sistema de Quick Switch ============
" Función para cambio rápido de layouts
function! QuickSwitchLayout(key)
    if !has_key(g:quick_layouts, a:key)
        echo '❌ Layout no configurado para ' . a:key
        return
    endif
    
    let layout_type = g:quick_layouts[a:key]
    
    " Mostrar preview antes de cambiar
    call PreviewLayout(layout_type)
    
    " Confirmar cambio
    let choice = input('Cambiar a layout "' . layout_type . '"? (y/n): ')
    if choice !=# 'y'
        return
    endif
    
    " Ejecutar el cambio de layout
    if layout_type ==# 'dev'
        call CreateDevLayout()
    elseif layout_type ==# 'debug'
        call CreateDebugLayout()
    elseif layout_type ==# 'test'
        call CreateTestLayout()
    elseif layout_type ==# 'review'
        call CreateReviewLayout()
    elseif layout_type ==# 'docs'
        call CreateDocsLayout()
    elseif layout_type ==# 'focus'
        call CreateFocusLayout()
    elseif layout_type ==# 'simple'
        call CreateSimpleLayout()
    elseif layout_type ==# 'triple'
        call CreateTripleLayout()
    else
        echo '❌ Layout desconocido: ' . layout_type
    endif
endfunction

" Función para configurar layouts favoritos
function! ConfigureQuickLayouts()
    echo '⚙️  Configuración de Quick Layouts:'
    echo ''
    echo 'Layouts disponibles:'
    echo '1. dev      - Layout de desarrollo (4 ventanas)'
    echo '2. debug    - Layout de debugging'
    echo '3. test     - Layout de testing'
    echo '4. review   - Layout de code review'
    echo '5. docs     - Layout de documentación'
    echo '6. focus    - Layout de concentración'
    echo '7. simple   - Layout simple'
    echo '8. triple   - Layout triple'
    echo ''
    
    for key in ['F1', 'F2', 'F3', 'F4']
        let current = get(g:quick_layouts, key, 'none')
        echo 'Alt+' . key . ' actual: ' . current
        let new_layout = input('Nuevo layout para Alt+' . key . ' (o Enter para mantener): ')
        if !empty(new_layout)
            let g:quick_layouts[key] = new_layout
        endif
    endfor
    
    echo '✅ Configuración de Quick Layouts actualizada'
    call ShowQuickLayoutsInfo()
endfunction

" Función para mostrar información de quick layouts
function! ShowQuickLayoutsInfo()
    echo '🚀 Quick Layouts configurados:'
    echo ''
    for [key, layout] in items(g:quick_layouts)
        echo 'Alt+' . key . ' → ' . layout
    endfor
    echo ''
    echo '📝 Usa <Space>qc para reconfigurar'
endfunction

" ============ Preview de Layouts ============
" Función para mostrar preview visual del layout
function! PreviewLayout(layout_type)
    echo '🔍 Preview del Layout "' . a:layout_type . '":'
    echo ''
    
    if a:layout_type ==# 'dev'
        echo '┌────────────┬────────────┐'
        echo '│  Código    │    Código  │'
        echo '│  Principal ├──────┬─────┤'
        echo '│            │Term1 │Term2│'
        echo '└────────────┴──────┴─────┘'
    elseif a:layout_type ==# 'debug'
        echo '┌──────────┬─────────┐'
        echo '│  Código  │Variables│'
        echo '│          ├─────────┤'
        echo '│          │ Stack   │'
        echo '└──────────┴─────────┘'
        echo '          Terminal'
    elseif a:layout_type ==# 'test'
        echo '┌──────────┬─────────┐'
        echo '│  Código  │  Tests  │'
        echo '│          ├─────────┤'
        echo '│          │Resultado│'
        echo '└──────────┴─────────┘'
        echo '          Terminal'
    elseif a:layout_type ==# 'review'
        echo '┌──────────┬──────────┐'
        echo '│ Original │Modificado│'
        echo '│          │          │'
        echo '│          │          │'
        echo '└──────────┴──────────┘'
        echo '          Git Terminal'
    elseif a:layout_type ==# 'docs'
        echo '┌──────────┬─────────┐'
        echo '│ Markdown │ Preview │'
        echo '│  Editor  ├─────────┤'
        echo '│          │  Links  │'
        echo '└──────────┴─────────┘'
        echo '          Terminal'
    elseif a:layout_type ==# 'focus'
        echo '┌───────────────────┐'
        echo '│                   │'
        echo '│      FOCUS        │'
        echo '│   Una ventana     │'
        echo '│                   │'
        echo '└───────────────────┘'
    else
        echo 'Layout: ' . a:layout_type
    endif
    echo ''
endfunction

" ============ Sistema de Layouts por Proyecto ============
" Función para detectar tipo de proyecto
function! DetectProjectType()
    let project_indicators = {
        \ 'django': ['manage.py', 'settings.py', 'wsgi.py'],
        \ 'react': ['package.json', 'src/App.js', 'public/index.html'],
        \ 'vue': ['package.json', 'src/App.vue', 'vue.config.js'],
        \ 'angular': ['package.json', 'angular.json', 'src/app/app.module.ts'],
        \ 'php': ['composer.json', 'index.php', 'config.php'],
        \ 'cpp': ['CMakeLists.txt', 'Makefile', '*.cpp'],
        \ 'python': ['requirements.txt', 'setup.py', '*.py'],
        \ 'node': ['package.json', 'server.js', 'app.js'],
        \ 'docs': ['README.md', 'docs/', 'mkdocs.yml']
    \ }
    
    for [project_type, indicators] in items(project_indicators)
        let matches = 0
        for indicator in indicators
            if glob(indicator) != ''
                let matches += 1
            endif
        endfor
        
        " Si coinciden al menos 2 indicadores, es probable que sea este tipo
        if matches >= 2
            return project_type
        endif
    endfor
    
    return 'generic'
endfunction

" Función para sugerir layout basado en proyecto
function! SuggestLayoutForProject()
    let project_type = DetectProjectType()
    let suggested_layouts = {
        \ 'django': 'dev',
        \ 'react': 'dev',
        \ 'vue': 'dev', 
        \ 'angular': 'dev',
        \ 'php': 'dev',
        \ 'cpp': 'debug',
        \ 'python': 'test',
        \ 'node': 'dev',
        \ 'docs': 'docs',
        \ 'generic': 'simple'
    \ }
    
    let suggested = get(suggested_layouts, project_type, 'simple')
    
    echo '🔍 Proyecto detectado: ' . project_type
    echo '🎯 Layout sugerido: ' . suggested
    echo ''
    
    let choice = input('¿Usar layout sugerido? (y/n): ')
    if choice ==# 'y'
        call QuickSwitchLayout('F1')  " Usar el sistema quick switch
        " Actualizar F1 temporalmente
        let old_f1 = g:quick_layouts['F1']
        let g:quick_layouts['F1'] = suggested
        call QuickSwitchLayout('F1')
        let g:quick_layouts['F1'] = old_f1
    endif
endfunction

" Comando para sugerir layout automáticamente
command! LayoutSuggest call SuggestLayoutForProject()

" ============ Funcion para cerrar todas las ventanas del layout ============
function! CloseAllLayoutWindows()
    only
endfunction

" ============ Web Development ============
" Emmet configuración
let g:user_emmet_mode='inv'  " habilitar en todos los modos
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript,javascriptreact,typescript,typescriptreact EmmetInstall

" Auto-cerrar tags HTML
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.tsx,*.vue,*.svelte'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'
let g:closetag_filetypes = 'html,xhtml,phtml,javascript,javascriptreact,typescript,typescriptreact'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" ============ JavaScript y React ============
" Sintaxis JavaScript mejorada
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" JSX configuración
let g:vim_jsx_pretty_colorful_config = 1

" ============ PHP ============
" Sintaxis PHP mejorada
let g:php_syntax_extensions_enabled = ['bcmath', 'bz2', 'core', 'curl', 'date', 'dom', 'ereg', 'gd', 'gettext', 'hash', 'iconv', 'json', 'libxml', 'mbstring', 'mcrypt', 'mhash', 'mysql', 'mysqli', 'openssl', 'pcre', 'pdo', 'pgsql', 'phar', 'reflection', 'session', 'simplexml', 'soap', 'sockets', 'spl', 'sqlite3', 'standard', 'tokenizer', 'wddx', 'xml', 'xmlreader', 'xmlwriter', 'zip', 'zlib']

" ============ C++ ============
" Resaltado C++ mejorado
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

" Clang-format
let g:clang_format#auto_format = 0
let g:clang_format#auto_format_on_insert_leave = 0

" ============ PostgreSQL ============
" Configuración de PostgreSQL
let g:sql_type_default = 'pgsql'

" vim-dadbod configuración
let g:db_ui_use_nerd_fonts = 1
let g:db_ui_winwidth = 30
let g:db_ui_notification_width = 33

" ============ Which-key (Menú de atajos) ============
if has('nvim-0.5')
    lua << EOF
require("which-key").setup({
  preset = "modern",
  delay = 1000,
  expand = 1,
  notify = false,
  spec = {
    { "<leader> ", ":nohlsearch<cr>", desc = "Limpiar búsqueda" },
    { "<leader>b", group = "+ Buffers" },
    { "<leader>e", ":NERDTreeToggle<cr>", desc = "Explorador" },
    { "<leader>f", group = "+ Archivos" },
    { "<leader>g", group = "+ Git" },
    { "<leader>p", group = "+ Python" },
    { "<leader>v", group = "+ Venv" },
    { "<leader>d", group = "+ Django/Layout" },
    { "<leader>dl", ":call CreateDevLayout()<cr>", desc = "Layout Principal (4 ventanas)" },
    { "<leader>ds", ":call CreateSimpleLayout()<cr>", desc = "Layout Simple" },
    { "<leader>dd", ":call CreateSideLayout()<cr>", desc = "Layout Lateral" },
    { "<leader>dt", ":call CreateTripleLayout()<cr>", desc = "Layout Triple" },
    { "<leader>dr", ":call DjangoRunServer()<cr>", desc = "Django RunServer" },
    { "<leader>dx", ":call RunTests()<cr>", desc = "Ejecutar Tests" },
    { "<leader>dD", ":call SetupDjangoDevLayout()<cr>", desc = "🔧 Setup Django Completo" },
    { "<leader>dm", ":call OpenDjangoModelsLeft()<cr>", desc = "📄 Models (izq)" },
    { "<leader>dy", ":call OpenDjangoUrlsLeft()<cr>", desc = "🔗 URLs (izq)" },
    { "<leader>da", ":call OpenDjangoAdminLeft()<cr>", desc = "⚙️ Admin (izq)" },
    { "<leader>df", ":call OpenDjangoFormsLeft()<cr>", desc = "📋 Forms (izq)" },
    { "<leader>l", group = "+ Layout Custom" },
    { "<leader>lh", ":call SplitHorizontal()<cr>", desc = "División Horizontal" },
    { "<leader>lv", ":call SplitVertical()<cr>", desc = "División Vertical" },
    { "<leader>lt", ":call CreateTerminalHere()<cr>", desc = "Terminal Aquí" },
    { "<leader>lc", ":call StartCustomLayout()<cr>", desc = "🎨 Iniciar Layout Personalizado" },
    { "<leader>ln", ":call NextLayoutStep()<cr>", desc = "📐 Siguiente Paso" },
    { "<leader>lH", ":call CustomSplitHorizontal()<cr>", desc = "➖ Split Horizontal" },
    { "<leader>lV", ":call CustomSplitVertical()<cr>", desc = "➗ Split Vertical" },
    { "<leader>lT", ":call CustomTerminal()<cr>", desc = "💻 Terminal Personalizado" },
    { "<leader>le", ":call CustomEditor()<cr>", desc = "📝 Editor Aquí" },
    { "<leader>lr", ":call CustomResize()<cr>", desc = "📏 Redimensionar" },
    { "<leader>ld", ":call FinishCustomLayout()<cr>", desc = "✅ Terminar Layout" },
    { "<leader>ls", ":call SaveCustomLayout()<cr>", desc = "💾 Guardar Layout" },
    { "<leader>ll", ":call LoadCustomLayout()<cr>", desc = "📂 Cargar Layout" },
    { "<leader>lm", ":call ManageCustomLayouts()<cr>", desc = "🗂️ Gestionar Layouts" },
    { "<leader>t", group = "+ Terminales" },
    { "<leader>t1", ":call ToggleTerminal(1)<cr>", desc = "Terminal 1" },
    { "<leader>t2", ":call ToggleTerminal(2)<cr>", desc = "Terminal 2" },
    { "<leader>r", group = "+ Ejecutar" },
    { "<leader>r1", desc = "Comando en Terminal 1" },
    { "<leader>r2", desc = "Comando en Terminal 2" },
    { "<leader>1", ":wincmd h<cr>", desc = "Ventana Izquierda" },
    { "<leader>2", ":wincmd l<cr>", desc = "Ventana Derecha" },
    { "<leader>3", ":wincmd j<cr>", desc = "Ventana Inferior" },
    { "<leader>4", ":wincmd k<cr>", desc = "Ventana Superior" },
    { "<leader>q", ":q!<cr>", desc = "Salir" },
    { "<leader>u", ":UndotreeToggle<cr>", desc = "Historial" },
    { "<leader>w", ":w<cr>", desc = "Guardar" },
  },
  triggers = {
    { "<leader>", mode = { "n", "v" } },
  },
  icons = {
    mappings = false,
  },
})
EOF
endif

 


