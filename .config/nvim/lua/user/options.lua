local options = {
	backup = false,
	clipboard = 'unnamedplus', -- allows neovim to access the system clipboard
	cmdheight = 2, -- more space in the neovim command line for displaying messages
	completeopt = { 'menuone', 'noselect' }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = 'utf-8',
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = 'a', -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 4, -- always show tabs
	smartcase = true,
	smartindent = true,
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false,
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = false, -- convert tabs to spaces
	shiftwidth = 4, -- the number of spaces inserted for each indentation
	tabstop = 4, -- display 4 spaces for a tab
	cursorline = true, -- highlight the current line
	laststatus = 3,
	showcmd = false,
	ruler = false,
	numberwidth = 4, -- set number column width to 2 {default 4}
	number = true, -- set numbered lines
	signcolumn = 'yes', -- always show the sign column, otherwise it would shift the text each time
	wrap = false, -- display lines as one long line
	scrolloff = 8, -- lines to skip before scrolling
	sidescrolloff = 8, -- chars to skip before scrolling
	guifont = 'Fira Code:h8.5', -- the font used in neovide
}
vim.opt.shortmess:append 'c'
vim.opt.whichwrap:append '<,>,[,],h,l'
vim.opt.iskeyword:append '-'

for k, v in pairs(options) do
	vim.opt[k] = v
end

local globals = {
	neovide_refresh_rate = 144,
	neovide_cursor_vfx_mode = 'railgun',
	neovide_floating_blur_amount_x = 2.0,
}

for k, v in pairs(globals) do
	vim.g[k] = v
end
