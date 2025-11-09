" ============ Which-key (Menú de atajos) ============
lua << EOF
local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

-- Configuración general
wk.setup({
  preset = "modern",
  icons = {
    group = " +", -- Para que se vea "+ Git"
  },
})

-- Registra los nombres de los GRUPOS
wk.register({
  b = { name = "+ Buffers" },
  d = { name = "+ Layout Dev" },
  f = { name = "+ FZF / Formato" },
  g = { name = "+ Git" },
  l = { name = "+ Layouts Custom" },
  r = { name = "+ Ejecutar (Run)" },
  t = { name = "+ Terminal" },
  ["<leader>"] = { name = "+ EasyMotion" }, -- Para <leader><leader>
}, { prefix = "<leader>" })

-- Registra las descripciones de las TECLAS ÚNICAS
wk.register({
  c = "Limpiar Búsqueda",
  e = "Explorador (Buscar)",
  q = "Salir",
  R = "Recargar Config",
  s = "Buscar/Reemplazar",
  w = " Guardar",
  h = " HTML",
  rn = "Renombrar",
  ["?"] = "Ayuda",
}, { prefix = "<leader>" })
EOF