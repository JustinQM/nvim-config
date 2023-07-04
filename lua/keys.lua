--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- remap the key used to leave insert mode
map('i', 'jj', '<ESC>', opts)
map('i', 'jk', '<ESC>', opts)

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

--Navigator
local navapi = require('Navigator')
vim.keymap.set({'n', 't'}, '<A-h>', navapi.left)
vim.keymap.set({'n', 't'}, '<A-l>', navapi.right)
vim.keymap.set({'n', 't'}, '<A-k>', navapi.up)
vim.keymap.set({'n', 't'}, '<A-j>', navapi.down)
vim.keymap.set({'n', 't'}, '<A-p>', navapi.previous)

--Neorg
map('n','<leader>nn',[[:Neorg index<CR>]], opts) --open index file
map('n','<leader>nr',[[:Neorg return<CR>]], opts) --return from neorg
map('n','<leader>nh',[[:Neorg inject-metadata<CR>]], opts) --inject metadata
map('n','<leader>ns',[[:Neorg generate-workspace-summary<CR>]], opts) --create summary
map('n','<leader>nt',[[:Neorg toc<CR>]], opts) --opens table of contents

--Lazygit
map('n','<leader>gg',":LazyGit<CR>",opts) --opens lazygit

-- Clipboard
map('n','<leader>y',"\"+y",opts)
map('v','<leader>y',"\"+y",opts)
