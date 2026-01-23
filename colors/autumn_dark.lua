-- ~/.config/nvim/colors/autumn_dark.lua

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "autumn_dark"

-- Paleta Autumn Dark Original
local colors = {
    bg = "#000000",
    fg = "#a5a5a5",
    selection = "#264f78",
    line_bg = "#101010",
    
    comment = "#6e718e",
    
    red = "#ff5866",         
    orange = "#ff9939",      
    green = "#afff76",       
    teal = "#55baa2",        
    blue = "#00abff",        
    purple = "#c55eff",      
    pink = "#ff6ec0",        
    
    grey = "#5a5a5a",
    dark_grey = "#2B2B2B",
}

local hl = vim.api.nvim_set_hl
local function set(group, opts)
    hl(0, group, opts)
end

-- =========================================
-- 1. Editor Base
-- =========================================
set("Normal", { fg = colors.fg, bg = colors.bg })
set("SignColumn", { bg = colors.bg })
set("CursorLine", { bg = colors.line_bg })
set("CursorLineNr", { fg = colors.blue, bold = true }) -- Neón
set("LineNr", { fg = "#444444" })
set("Visual", { bg = colors.selection })
set("Search", { fg = "#ffffff", bg = "#515c6a" })
set("MatchParen", { fg = colors.green, bold = true, underline = true })

-- =========================================
-- 2. Sintaxis General (Con Boost de Negrita)
-- =========================================
set("Comment", { fg = colors.comment, italic = true })
set("String", { fg = colors.green }) 
set("Number", { fg = colors.orange })
set("Boolean", { fg = colors.orange, bold = true }) -- Neón
set("Float", { fg = colors.orange })
set("Constant", { fg = colors.orange })

-- Identificadores
set("Identifier", { fg = colors.fg }) 
set("Function", { fg = colors.purple, bold = true }) -- Neón (Funciones brillantes)

-- Keywords (Estructura Lógica)
set("Statement", { fg = colors.pink, bold = true })      -- Neón (if, else, return)
set("Conditional", { fg = colors.pink, bold = true })
set("Repeat", { fg = colors.pink, bold = true })
set("Label", { fg = colors.pink, bold = true })
set("Operator", { fg = colors.teal })
set("Keyword", { fg = colors.pink, bold = true })        -- Neón
set("Exception", { fg = colors.pink, bold = true })

-- Tipos y Definiciones
set("PreProc", { fg = colors.pink })
set("Include", { fg = colors.purple })
set("Type", { fg = colors.blue, bold = true })           -- Neón (int, bool, Tipos)
set("StorageClass", { fg = colors.blue, bold = true })   -- Neón (const, let)
set("Structure", { fg = colors.blue, bold = true })      -- Neón (class, struct)
set("Typedef", { fg = colors.blue, bold = true })

set("Special", { fg = colors.teal })
set("Delimiter", { fg = colors.grey })

-- =========================================
-- 3. HTML (Corregido: Tags Brillantes)
-- =========================================
set("htmlTagName", { fg = colors.red, bold = true })    -- Neón
set("htmlSpecialTagName", { fg = colors.blue, bold = true })
set("htmlTag", { fg = colors.grey })
set("htmlEndTag", { fg = colors.grey })
set("htmlArg", { fg = colors.orange })
set("htmlString", { fg = colors.green })

-- Treesitter HTML overrides
set("@tag", { fg = colors.red, bold = true })           -- Neón
set("@tag.delimiter", { fg = colors.grey })
set("@tag.attribute", { fg = colors.orange })

-- =========================================
-- 4. LaTeX (Corregido: Balanceado)
-- =========================================
set("texStatement", { fg = colors.blue })      
set("texBeginEnd", { fg = colors.pink, bold = true })   -- Neón (Solo estructura)
set("texBeginEndName", { fg = colors.orange }) 
set("texOption", { fg = colors.teal })         
set("texArgument", { fg = colors.fg })

-- Treesitter LaTeX overrides
set("@function.macro", { fg = colors.blue })
set("@text.environment", { fg = colors.pink, bold = true }) -- Neón
set("@text.environment.name", { fg = colors.orange }) 
set("@punctuation.special", { fg = colors.grey })

-- =========================================
-- 5. JS/TS/Python
-- =========================================
set("@variable", { fg = colors.fg })
set("@variable.builtin", { fg = colors.blue, bold = true }) -- this, self
set("@keyword.function", { fg = colors.blue, bold = true }) -- def, function
set("@keyword.return", { fg = colors.pink, bold = true })
set("@property", { fg = colors.teal })

-- =========================================
-- 6. UI Plugins
-- =========================================
set("NERDTreeDir", { fg = colors.blue, bold = true })
set("NERDTreeCWD", { fg = colors.pink })
set("NERDTreeExecFile", { fg = colors.green })
set("GitGutterAdd", { fg = colors.green })
set("GitGutterChange", { fg = colors.orange })
set("GitGutterDelete", { fg = colors.red })
set("Pmenu", { bg = colors.dark_grey, fg = colors.fg })
set("PmenuSel", { bg = colors.blue, fg = "#ffffff", bold = true })
set("CocMenuSel", { bg = colors.blue, fg = "#ffffff", bold = true })
set("StatusLine", { bg = "#303030", fg = colors.fg })
set("StatusLineNC", { bg = "#101010", fg = "#666666" })