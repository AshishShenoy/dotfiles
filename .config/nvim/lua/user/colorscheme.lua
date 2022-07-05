local onedark_status_ok, onedark = pcall(require, "onedark")
if onedark_status_ok then
    onedark.setup {
        transparent = true,
        term_colors = true,
        code_style = {
            comments = 'italic',
            keywords = 'none',
            functions = 'italic',
            strings = 'none',
            variables = 'none'
        },
    }
end

local catppuccin_status_ok, catppuccin = pcall(require, "catppuccin")
if catppuccin_status_ok then
    catppuccin.setup {
        transparent_background = true,
        term_colors = true,
        code_style = {
            comments = 'italic',
            keywords = 'none',
            functions = 'italic',
            strings = 'none',
            variables = 'none'
        },
    }
end

vim.cmd [[
try
  colorscheme darkplus
  " colorscheme onedark
  " colorscheme catppuccin
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
