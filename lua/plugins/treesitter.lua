return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function () 
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = { "c","lua","vimdoc"},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },  
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = false, -- set to `false` to disable one of the mappings
					node_incremental = "tn",
					scope_incremental = "ts",
					node_decremental = "tb",
				},
			},
		})
		end
	}
}
