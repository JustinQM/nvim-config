--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
--
vim.cmd[[nnoremap <SPACE> <Nop>]] --clear space bars keybind
vim.g.mapleader = " " --make spacebar leader
vim.cmd[[nnoremap "," <Nop>]] --clear comma keybind
vim.g.maplocalleader = ","
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('plug')      -- Plugins

--filebrowser
require("nvim-tree").setup({  
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            }
        }
    },
})
  
require('oil').setup({use_default_keymaps=true,
	keymaps = {
		["cd"] = "actions.cd",
	}
}) --oil

--Treesitter
require("nvim-treesitter.configs").setup({
    ensure_installed = {"c","lua","python","vim","vimdoc","query","cpp"},
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})

--[AUTOCOMPLETE]
--coq
require('coq')
vim.cmd[[COQnow -s]]
require('coq_settings')


--LSP
require('lsp')

--[THEME]
require('tokyonight').setup({
    style = 'moon',
    styles = {
        comments = {italic = true}
    },
})

--Neorg configuration
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.norg"},
  command = "set conceallevel=3"
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.norg"},
  command = "set nofoldenable"
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.norg"},
  command = "set concealcursor=nc"
})
-- MISC
require('lualine').setup()
require('nvim-autopairs').setup({ map_bs = false, map_cr = false }) --autoclosing brackets etc
require('barbar').setup() --tabbing top bar
require('Navigator').setup() --keybinds for switching between buffers
require('Comment').setup({ --Toggle comments 
    sticky = true,
    padding = true,
    ignore = nil,
    toggler = {
        line = '<LEADER>//',
        block = '<leader>??',
    },
    opleader = {
        line = '<LEADER>/',
        block = '<LEADER>?',
    },
    extra = {
        above = '<LEADER>/O',
        below = '<LEADER>/o',
        eol = '<LEADER>/a',
    },
    mappings = {
        basic = true,
        extra = true,
    },
    pre_hook = nil,
    post_hook = nil,
})

require('leap').add_default_mappings() -- leap with default mappings

require('toggleterm').setup({
	open_mapping = "<leader>tt",
	terminal_mappings = false,
	insert_mappings = false,
}) -- toggle term
