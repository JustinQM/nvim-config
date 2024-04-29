return {
  -- kanagawa
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
		vim.cmd([[colorscheme kanagawa]])
		vim.cmd([[hi LineNr guibg=none guifg=#ffffff]]) --sets relative line numbers background to transparent
    end,
  },
}
