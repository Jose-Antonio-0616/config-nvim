" =====================================================
" which-key-config.vim - Configuración del menú de atajos
" =====================================================

" Configuración ultra-simple de which-key
lua << EOF
local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

-- Configuración mínima
wk.setup()

-- Registrar solo los mapeos básicos del leader
wk.register({
  w = { ":w<cr>", "Guardar" },
  q = { ":q!<cr>", "Salir" },
  e = { ":NERDTreeToggle<cr>", "Explorador" },
  r = { ":source $MYVIMRC<cr>", "Recargar" },
  [" "] = { ":nohlsearch<cr>", "Limpiar búsqueda" },
  
  f = {
    name = "+ Archivos",
    f = { ":Files<cr>", "Buscar archivos" },
    g = { ":GFiles<cr>", "Archivos Git" },
    b = { ":Buffers<cr>", "Buffers" },
  },
  
  g = {
    name = "+ Git",
    a = { ":Git add .<cr>", "Add todo" },
    c = { ":Git commit<cr>", "Commit" },
    s = { ":Git status<cr>", "Status" },
    p = { ":Git push<cr>", "Push" },
    l = { ":Git pull<cr>", "Pull" },
  },
  
  b = {
    name = "+ Buffers",
    n = { ":bnext<cr>", "Siguiente" },
    p = { ":bprevious<cr>", "Anterior" },
    d = { ":bdelete<cr>", "Eliminar" },
  },
  
  t = {
    name = "+ Herramientas",
    e = { ":terminal<cr>", "Terminal" },
    t = { ":TagbarToggle<cr>", "Tagbar" },
  },
  
  u = { ":UndotreeToggle<cr>", "Historial" },
  n = { ":set number!<cr>", "Números" },
  s = { ":%s//gc<left><left><left>", "Buscar/Reemplazar" },
}, { prefix = "<leader>" })

EOF
