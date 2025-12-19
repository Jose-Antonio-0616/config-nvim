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
set updatetime=300
set shortmess+=c

" Función auxiliar para verificar espacios (DEBE ESTAR ANTES DE LOS MAPEOS)
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Usar <tab> para navegar en el menú de completado
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Usar <CR> (Enter) para confirmar la selección.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Usar Ctrl+Space para activar el autocompletado manualmente
inoremap <silent><expr> <C-Space> coc#refresh()

" ============ Auto-pairs ============
let g:AutoPairsShortcutToggle = '<M-p>'

" ============ Commentary ============
autocmd FileType apache setlocal commentstring=#\ %s

" ============ Treesitter ============
" Configuración completa de Treesitter para todo el stack
if isdirectory(expand('~/.local/share/nvim/plugged/nvim-treesitter/lua'))
    lua << EOF
    local status, ts = pcall(require, "nvim-treesitter.configs")
    if status then
        ts.setup {
          ensure_installed = {
            "python", "html", "css", "javascript", "typescript",
            "lua", "vim", "vimdoc", "query", "json", "yaml",
            "bash", "markdown", "comment"
          },
          sync_install = false,
          auto_install = true,
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },
          indent = { enable = true },
          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = "gnn",
              node_incremental = "grn",
              scope_incremental = "grc",
              node_decremental = "grm",
            },
          },
        }
    end
EOF
endif

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

" Función para mostrar layout actual en statusline
function! CurrentLayoutStatusline()
    let layout_name = get(g:current_layout_info, 'name', 'basic')
    let layout_type = get(g:current_layout_info, 'type', 'basic')
    let windows_count = winnr('$')

    " Iconos por tipo de layout (solo los que usas)
    let layout_icons = {
        \ 'dev': '🔧',
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
            echo '    • ' . fnamemodify(file, ':t')
        endfor
        if len(info.last_files) > 3
            echo '    • ... y ' . (len(info.last_files) - 3) . ' más'
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

    " Definir colores por tipo de layout (solo los que usas)
    let layout_colors = {
        \ 'dev': 'ctermfg=green guifg=#50fa7b',
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

" ============ Sistema de Persistencia de Layouts ============
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

" ============ LAYOUT 'DEV' ============
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

" ============ Funciones de Terminal (Usadas por Dev y Custom) ============
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

" ============ Funcion para cerrar todas las ventanas del layout ============
function! CloseAllLayoutWindows()
    only
endfunction

" ============ Web Development ============
" Emmet configuración
let g:user_emmet_mode='inv'  " habilitar en todos los modos
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript,typescript EmmetInstall

" Clang-format
let g:clang_format#auto_format = 0
let g:clang_format#auto_format_on_insert_leave = 0

" ============ Latex ===============
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_quickfix_mode = 0

" ============ Configuración de Quarto y Iron (LUA) ============

lua << EOF
local otter_ok, otter = pcall(require, "otter")
if not otter_ok then
    vim.notify("otter.nvim no se pudo cargar", vim.log.levels.WARN)
    return
end
otter.setup({
    buffers = {},
})

local quarto_ok, quarto = pcall(require, "quarto")
if not quarto_ok then
    vim.notify("quarto-nvim no se pudo cargar", vim.log.levels.WARN)
    return
end
quarto.setup({
    lspFeatures = {
        languages = { "python", "bash", "html" }, 
    },
    codeRunner = {
        enabled = true,
        default_method = "iron",
        ft_runners = { 
            quarto = "iron", 
            python = "iron",
        },
        never_run = { "yaml"},
    },
})

local iron_ok, iron = pcall(require, "iron.core")
if not iron_ok then
    vim.notify("iron.nvim no se pudo cargar", vim.log.levels.WARN)
    return
end
iron.setup({
    config = {
        scratch_repl   = true,
        repl_definition = {
            python = {
                command = { "ipython", "--no-autoindent" },
                format = require("iron.fts.common").brackets_paste_python,
                block_dividers = { "# %%", "#%%"},
            },
            quarto = {
                command = { "ipython", "--no-autoindent" },
                format = require("iron.fts.common").brackets_paste_python,
                block_dividers = { "# %%", "#%%", "```", "```{python}"},
            }
        },
        repl_filetype = function(bufnr, ft) return ft end,
        dap_integration = true,
        repl_open_cmd = require("iron.view").split.vertical.rightbelow("%50"),
        ignore_blank_lines = true,
    },
})

EOF

" ============ Which-key (Menú de atajos) ============
if has('nvim-0.5')
    lua << EOF

require("which-key").setup({
    preset = "modern",
    delay = 500,
    expand = 1,
    notify = false,
    spec = {
        -- Teclas Únicas (Vimscript-safe Lua)
        { "<leader>c", function() vim.cmd("nohlsearch") end, desc = "Limpiar Búsqueda" },
        { "<leader>e", function() vim.cmd("NERDTreeFind") end, desc = "Explorador (Buscar)" },
        { "<leader>q", function() vim.cmd("q!") end, desc = "Salir" },
        { "<leader>w", function() vim.cmd("w") end, desc = " Guardar" },
        { "<leader>wq", function() vim.cmd("wq") end, desc = "Guardar y Salir" },
        { "<leader>?", function() vim.cmd("WhichKey") end, desc = "Ayuda" },
        { "<leader>ht", function() vim.bo.filetype = "html" end, desc = "HTML" },
        { "<leader>rn", "<Plug>(coc-rename)", desc = "Renombrar" },

        -- Arreglo para $MYVIMRC (Vim var -> Lua)
        {
        "<leader>R",
        function() vim.cmd("source " .. vim.fn.expand("$MYVIMRC")) end,
        desc = "Recargar Config"
        },

        -- Arreglo para <left><left><left> (enviar teclas)
        {
        "<leader>s",
        function() vim.fn.feedkeys(":%s//gc<Left><Left><Left>") end,
        desc = "Buscar/Reemplazar"
        },

        -- Menú de FZF / Formato
        {
        "<leader>f",
        "<Plug>(coc-format-selected)",
        desc = "Formatear",
        group = "+ FZF / Formato"
        },
        { "<leader>fg", function() vim.cmd("GFiles") end, desc = "Archivos Git" },
        { "<leader>fb", function() vim.cmd("Buffers") end, desc = "Buffers" },
        { "<leader>fl", function() vim.cmd("Lines") end, desc = "Líneas" },
        { "<leader>ft", function() vim.cmd("Tags") end, desc = "Tags" },

        -- Menú de Git
        { "<leader>g", group = "+ Git" },
        { "<leader>ga", function() vim.cmd("Git add .") end, desc = "Add todo" },
        { "<leader>gc", function() vim.cmd("Git commit") end, desc = "Commit" },
        { "<leader>gst", function() vim.cmd("Git status") end, desc = "Status" },
        { "<leader>gsh", function() vim.cmd("Git push") end, desc = "Push" },
        { "<leader>gll", function() vim.cmd("Git pull") end, desc = "Pull" },
        { "<leader>gb", function() vim.cmd("Git branch") end, desc = "Branch" },
        { "<leader>go", function() vim.cmd("Git checkout") end, desc = "Checkout" },
        { "<leader>gn", function() vim.cmd("GitGutterNextHunk") end, desc = "Sig. Hunk" },
        { "<leader>gp", function() vim.cmd("GitGutterPrevHunk") end, desc = "Ant. Hunk" },
        { "<leader>gh", function() vim.cmd("GitGutterStageHunk") end, desc = "Stage Hunk" },
        { "<leader>gu", function() vim.cmd("GitGutterUndoHunk") end, desc = "Undo Hunk" },

        -- Menú de Buffers
        { "<leader>b", group = "+ Buffers" },
        { "<leader>bn", function() vim.cmd("bnext") end, desc = "Siguiente" },
        { "<leader>bp", function() vim.cmd("bprevious") end, desc = "Anterior" },
        { "<leader>bd", function() vim.cmd("bdelete") end, desc = "Eliminar" },

        -- Menú de Terminal
        { "<leader>t", group = "+ Terminal" },
        { "<leader>te", function() vim.cmd("terminal") end, desc = "Abrir Terminal" },
        { "<leader>tn", function() vim.cmd("set number!") end, desc = "Números línea" },
        { "<leader>tr", function() vim.cmd("set relativenumber!") end, desc = "Números relativos" },
        { "<leader>t1", function() vim.cmd("call ToggleTerminal(1)") end, desc = "Terminal 1" },
        { "<leader>t2", function() vim.cmd("call ToggleTerminal(2)") end, desc = "Terminal 2" },

        -- Menú de Layout Dev
        { "<leader>d", group = "+ Layout Dev" },
        { "<leader>dl", function() vim.cmd("call CreateDevLayout()") end, desc = "Cargar Layout Dev" },

        -- Menú de Layouts Custom
        { "<leader>l", group = "+ Layouts Custom" },
        { "<leader>la", function() vim.cmd("call AdjustDevLayout()") end, desc = "Ajustar Layout" },
        { "<leader>li", function() vim.cmd("call ShowCurrentLayoutInfo()") end, desc = "Info" },
        { "<leader>lS", function() vim.cmd("call SaveLayoutState(vim.fn.input('Nombre: '))") end, desc = "Guardar Estado" },
        { "<leader>lq", function() vim.cmd("call CloseAllLayoutWindows()") end, desc = "Cerrar Layouts" },
        { "<leader>lc", function() vim.cmd("call StartCustomLayout()") end, desc = "Iniciar Custom" },
        { "<leader>ln", function() vim.cmd("call NextLayoutStep()") end, desc = "Paso Custom" },
        { "<leader>lH", function() vim.cmd("call CustomSplitHorizontal()") end, desc = "Split H Custom" },
        { "<leader>lV", function() vim.cmd("call CustomSplitVertical()") end, desc = "Split V Custom" },
        { "<leader>lT", function() vim.cmd("call CustomTerminal()") end, desc = "Terminal Custom" },
        { "<leader>le", function() vim.cmd("call CustomEditor()") end, desc = "Editor Custom" },
        { "<leader>lr", function() vim.cmd("call CustomResize()") end, desc = "Resize Custom" },
        { "<leader>ld", function() vim.cmd("call FinishCustomLayout()") end, desc = "Terminar Custom" },
        { "<leader>ls", function() vim.cmd("call SaveCustomLayout()") end, desc = "Guardar Custom" },
        { "<leader>ll", function() vim.cmd("call LoadCustomLayout()") end, desc = "Cargar Custom" },
        { "<leader>lm", function() vim.cmd("call ManageCustomLayouts()") end, desc = "Gestionar Custom" },

        -- MenÚ de Ejecución (Run)
        { "<leader>r", group = "+ Ejecutar (Run)" },
        { "<leader>r1", function() vim.cmd("call RunInTerminal(vim.fn.input('Comando T1: '), 1)") end, desc = "Run T1" },
        { "<leader>r2", function() vim.cmd("call RunInTerminal(vim.fn.input('Comando T2: '), 2)") end, desc = "Run T2" },

        {
            "<leader>rl",function()
                if vim.bo.filetype == 'quarto' then
                    require("quarto.runner").run_line()
                else
                    require("iron.core").send_line()
                end
            end, desc = "Correr Línea"
        },

        {
            "<leader>rb", function()
                if vim.bo.filetype == 'quarto' then
                    require("quarto.runner").run_cell()
                else
                    require("iron.core").send_code_block()
                end
            end, desc = "Correr Celda/Bloque"
        },

        {
            "<leader>rn", function()
                if vim.bo.filetype == 'quarto' then
                    require("quarto.runner").run_cell()
                    vim.cmd("QuartoCellNext")
                else
                    require("iron.core").send_code_block_and_move()
                end
            end, desc = "Correr Bloque y Avanzar"
        },

        {
            "<leader>r", mode = 'v',
            function()
                if vim.bo.filetype == 'quarto' then
                    require("quarto.runner").run_range()
                else
                    require("iron.core").send_visual()
                end
            end, desc = "Correr Selección"
        },

        { 
            "<leader>rr", function() 
                if vim.bo.filetype == 'quarto' then
                    vim.cmd("IronRepl python")
                else
                    vim.cmd("IronRepl") 
                end 
            end, desc = "Abrir/Cerrar REPL" 
        },

        -- Menú de Quarto -- NUEVO
        { "<leader>p", group = "+ Quarto" },
        { "<leader>pp", function() vim.cmd("QuartoPreview") end, desc = "Previsualizar Quarto" },
        { "<leader>ps", function() vim.cmd("QuartoClosePreview") end, desc = "Detener Preview" },
        { "<leader>pr", function() vim.cmd("QuartoRender") end, desc = "Renderizar Quarto" },

        -- Menú de EasyMotion
        { "<leader><leader>", group = "+ EasyMotion" },
        { "<leader><leader>w", "<Plug>(easymotion-bd-w)", desc = "Word" },
        { "<leader><leader>f", "<Plug>(easymotion-bd-f)", desc = "Find" },
        { "<leader><leader>s", "<Plug>(easymotion-s2)", desc = "Search (2 char)" },
        { "<leader><leader>j", "<Plug>(easymotion-j)", desc = "Line Down" },
        { "<leader><leader>k", "<Plug>(easymotion-k)", desc = "Line Up" },
        { "<leader><leader>/", "<Plug>(easymotion-sn)", desc = "Search" },
    
        -- Menú de LaTeX
        { "<leader>x", group = "+ LaTeX" },
        { "<leader>xc", function() vim.cmd("VimtexCompile") end, desc = "Compilar (Toggle)" },
        { "<leader>xv", function() vim.cmd("VimtexView") end, desc = "Ver PDF" },
        { "<leader>xe", function() vim.cmd("VimtexErrors") end, desc = "Ver Errores" },
        { "<leader>xk", function() vim.cmd("VimtexStop") end, desc = "Detener Compilación" },
        { "<leader>xl", function() vim.cmd("VimtexClean") end, desc = "Limpiar Auxiliares" },
        { "<leader>xt", function() vim.cmd("VimtexTocToggle") end, desc = "Índice (TOC)" },
        { "<leader>xi", function() vim.cmd("VimtexInfo") end, desc = "Info de Depuración" },

    },
    triggers = {
        { "<leader>", mode = { "n", "v" } },
    },
    icons = {
        group = " +",
    },
})
EOF
endif
