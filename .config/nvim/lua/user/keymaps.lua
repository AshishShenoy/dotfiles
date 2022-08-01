local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)
-- Resize with arrows
keymap('n', '<C-Up>', ':resize -2<CR>', opts)
keymap('n', '<C-Down>', ':resize +2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)
-- Navigate buffers
keymap('n', '<S-l>', ':bnext<CR>', opts)
keymap('n', '<S-h>', ':bprevious<CR>', opts)
-- Clear search highlights on <ESC>
keymap('n', '<Esc>', ':nohlsearch<CR>', opts)
-- Disable Ex mode and remap to close buffer
keymap('n', 'Q', '<cmd>Bdelete!<CR>', opts)

-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)
-- Move text up and down
keymap('v', '<S-j>', ':m .+1<CR>==', opts)
keymap('v', '<S-k>', ':m .-2<CR>==', opts)
-- Prevent paste replacing from overwriting the clipboard
keymap('v', 'p', '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap('x', '<S-j>', ':move \'>+1<CR>gv-gv', opts)
keymap('x', '<S-k>', ':move \'<-2<CR>gv-gv', opts)

--- Command ---
-- Write to protected files
keymap('c', 'w!!', 'w !sudo tee > /dev/null %', opts)

--- Neovide specific ---
keymap('n', '<c-c>', '"+y', opts)
keymap('v', '<c-c>', '"+y', opts)
keymap('n', '<c-s-v>', '"+p', opts)
keymap('i', '<c-s-v>', '<c-r>+', opts)
keymap('c', '<c-s-v>', '<c-r>+', opts)
keymap('i', '<c-r>', '<c-v>', opts)
