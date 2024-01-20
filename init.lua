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
require('plug')      -- Plugins
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps

--filebrowser
require('oil').setup({use_default_keymaps=true,
	skip_confirm_for_simple_edits = true,
	keymaps = {
		["cd"] = "actions.cd",
	}
}) --oil

--Treesitter

require('nvim-treesitter.parsers').get_parser_configs().asm = {
    install_info = {
        url = 'https://github.com/rush-rs/tree-sitter-asm.git',
        files = { 'src/parser.c' },
        branch = 'main',
    },
}
require("nvim-treesitter.configs").setup({
    ensure_installed = {"c","lua","python","vim","vimdoc","query","cpp","asm"},
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

-- MISC
require('barbar').setup({ --tabbing top bar
	exclude_ft = {'compilation'}, --excluded filetypes from bar
}) 
require('lualine').setup()
require('nvim-autopairs').setup({ map_bs = false, map_cr = false }) --autoclosing brackets etc
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
