--[[ plug.lua ]]

-- BOOTSTRAP
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    --Packer
    use 'wbthomason/packer.nvim'

    --filebrowser
    use {'nvim-tree/nvim-tree.lua'}
    use {'stevearc/oil.nvim'}

    --autocomplete
    use {'ms-jpq/coq_nvim', branch = 'coq'} --coq
    use {'ms-jpq/coq.artifacts', branch = 'artifacts'}

    use { --treesitter
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use{"neovim/nvim-lspconfig"} --LSP
    --telescope
    use {'nvim-telescope/telescope.nvim', tag = '0.1.3',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {'BurntSushi/ripgrep'} --grep for telescope

    --theme stuff
    use {"folke/tokyonight.nvim"} --theme
    use {'nvim-lualine/lualine.nvim'} --status line


    --Git
    use({
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = { 
            "nvim-lua/plenary.nvim",
        },
    })
    use({
        "ej-shafran/compile-mode.nvim",
        requires = { 
            "nvim-lua/plenary.nvim",
			{ "m00qek/baleia.nvim", tag = "v1.3.0" },
        },
		opts = {
			default_command = "make"
		}
    })
    --Misc
    use {'mhinz/vim-startify'} --startify
	use {'rcarriga/nvim-notify'} --nvim notifty
    use {'windwp/nvim-autopairs'} --auto closing brackets and etc
    use {'nvim-tree/nvim-web-devicons'} --icons
    use { 'lewis6991/gitsigns.nvim' } --git status
    use { 'romgrk/barbar.nvim' } --tabbing top bar
    use { 'RRethy/vim-illuminate' } --highlights other instance of word under cursor
    use { 'numToStr/Navigator.nvim' } --adds keybinds for moving to split windows
    use {'numToStr/Comment.nvim'} -- comment toggling
    use {'ggandor/leap.nvim'} -- leap (leap around the file)
	use {'sakhnik/nvim-gdb'} -- gdb support
	use {'akinsho/toggleterm.nvim'}  -- toggle terminal window
    
    
end)
