return
{
	--mason
	{
		"williamboman/mason.nvim",
		lazy = false,
		init = function()
			require("mason").setup()
		end,
	},
	--mason_lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		init = function()
			require("mason-lspconfig").setup({
				ensure_installed = {"lua_ls","clangd","pyright","bashls","html","marksman","powershell_es"}
			})
		end,
	},
	--lspconfig
	{
		"neovim/nvim-lspconfig",
		init = function()
			local lsp = require("lspconfig")
			lsp.lua_ls.setup{}
			lsp.clangd.setup{}
			lsp.pyright.setup{}
			lsp.bashls.setup{}
			lsp.html.setup{}
			lsp.marksman.setup{}
			lsp.powershell_es.setup{}
		end,
	}
}
