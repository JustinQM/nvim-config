--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- remap the key used to leave insert mode
map('i', 'jj', '<ESC>', opts)
map('i', 'jk', '<ESC>', opts)
map('t', 'jk', '<C-\\><C-n>', opts)
map('t', 'jj', '<C-\\><C-n>', opts)
map('t', '<ESC>', '<C-\\><C-n>', opts)

--nvimtree
map('n', '<leader>w', [[:NvimTreeToggle<cr>]], opts) --toggle

--oil
map('n', '<leader>e', [[:Oil<cr>]], opts) --toggle

--telescope
map('n', '<leader>ff', [[:Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>]], opts) --find files
map('n', '<leader>fw', [[:Telescope live_grep find_command=rg,--ignore,--hidden,--files<cr>]], opts) --find words
map('n', '<leader>fb', [[:Telescope buffers<cr>]], opts) --find buffers
map('n', '<leader>fh', [[:Telescope help_tags<cr>]], opts) --find buffers

--barbar (defaults)
-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Close buffer
map('n', '<A-w>', '<Cmd>BufferClose<CR>', opts)
map('n', '<A-W>', '<Cmd>BufferClose!<CR>', opts)
map('t', '<A-W>', '<Cmd>BufferClose!<CR>', opts)

-- Open terminal in new buffer (vs toggle term split window default)
map('n', '<leader>tn', [[:term<cr>]], opts) --find words
map('t', '<leader>tn', [[:term<cr>]], opts) --find words

--Navigator
local navapi = require('Navigator')
vim.keymap.set({'n', 't'}, '<A-h>', navapi.left)
vim.keymap.set({'n', 't'}, '<A-l>', navapi.right)
vim.keymap.set({'n', 't'}, '<A-k>', navapi.up)
vim.keymap.set({'n', 't'}, '<A-j>', navapi.down)
vim.keymap.set({'n', 't'}, '<A-p>', navapi.previous)

--Lazygit
map('n','<leader>gg',":LazyGit<CR>",opts) --opens lazygit

-- Compile Mode
map('n','<leader>CC',":Compile<CR>",opts) 
map('n','<leader>cc',":Recompile<CR>",opts) 
map('n','<leader>cn',":NextError<CR>",opts) 
map('n','<leader>cb',":PrevError<CR>",opts) 


-- Clipboard
map('n','<leader>y',"\"+y",opts)
map('v','<leader>y',"\"+y",opts)
