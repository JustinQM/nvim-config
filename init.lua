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

--Macros
require("recorder").setup {
	-- Named registers where macros are saved (single lowercase letters only).
	-- The first register is the default register used as macro-slot after
	-- startup.
	slots = { "a", "b" },

	mapping = {
		startStopRecording = "q",
		playMacro = "Q",
		switchSlot = "<C-q>",
		editMacro = "cq",
		deleteAllMacros = "dq",
		yankMacro = "yq",
		-- ⚠️ this should be a string you don't use in insert mode during a macro
		addBreakPoint = "##",
	},

	-- Clears all macros-slots on startup.
	clear = false,

	-- Log level used for any notification, mostly relevant for nvim-notify.
	-- (Note that by default, nvim-notify does not show the levels `trace` & `debug`.)
	logLevel = vim.log.levels.INFO,

	-- If enabled, only critical notifications are sent.
	-- If you do not use a plugin like nvim-notify, set this to `true`
	-- to remove otherwise annoying messages.
	lessNotifications = false,

	-- Use nerdfont icons in the status bar components and keymap descriptions
	useNerdfontIcons = true,

	-- Performance optimzations for macros with high count. When `playMacro` is
	-- triggered with a count higher than the threshold, nvim-recorder
	-- temporarily changes changes some settings for the duration of the macro.
	performanceOpts = {
		countThreshold = 100,
		lazyredraw = true, -- enable lazyredraw (see `:h lazyredraw`)
		noSystemClipboard = true, -- remove `+`/`*` from clipboard option
		autocmdEventsIgnore = { -- temporarily ignore these autocmd events
			"TextChangedI",
			"TextChanged",
			"InsertLeave",
			"InsertEnter",
			"InsertCharPre",
		},
	},

}

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
