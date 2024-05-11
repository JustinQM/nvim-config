return
{
	--mason
	{
		"williamboman/mason.nvim",
	},
	--mason_lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
	},
	--lspconfig
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		init = function()
			require("mason").setup() --load mason
			require("mason-lspconfig").setup({ --load mason-lspconfig
				ensure_installed = {"lua_ls","clangd","pyright","bashls","html","marksman","powershell_es"}
			})
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
