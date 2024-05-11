return {
  -- kanagawa
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
		vim.cmd([[colorscheme kanagawa]])
		vim.cmd([[hi LineNr guibg=none guifg=#ffffff]]) --sets relative line numbers background to transparent
		overrides = function(colors)
			return {
				Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },  -- add `blend = vim.o.pumblend` to enable transparency
				PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
				PmenuSbar = { bg = theme.ui.bg_m1 },
				PmenuThumb = { bg = theme.ui.bg_p2 },
			}
		end
    end,
  },
}
