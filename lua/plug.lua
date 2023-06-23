-- [[ plug.lua ]]

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
    use {'codota/tabnine-nvim', run = "./dl_binaries.sh"} --tabnine

    --telescope
    use {'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {'BurntSushi/ripgrep'} --grep for telescope

    --theme stuff
    use {"folke/tokyonight.nvim"} --theme
    use {'nvim-lualine/lualine.nvim'} --status line

    --Note taking    
    use {
        "nvim-neorg/neorg",
        config = function()
            require('neorg').setup {
                load = {
                    ["core.defaults"] = {}, -- Loads default behaviour
                    ["core.concealer"] = { -- Concealer settings
                        config = {
                            icons = {
                                code_block = {
                                    conceal = true,
                                    content_only = false,
                                    width = "content",
                                },
                            },
                        },
                    },
                    ["core.dirman"] = { -- Manages Neorg workspaces
                    config = 
                        {
                            workspaces = 
                            {
                                notes = "~/.notes",
                            },
                            default_workspace = "notes",
                        },
                    },
                    ["core.qol.toc"] = { config = { close_after_use = true }},
                    ["core.summary"] = {},
                },
            }
        end,
        run = ":Neorg sync-parsers",
        requires = "nvim-lua/plenary.nvim",
    }

    --Misc
    use {'mhinz/vim-startify'} --startify
    use {'windwp/nvim-autopairs'} --auto closing brackets and etc
    use {'nvim-tree/nvim-web-devicons'} --icons
    use { 'lewis6991/gitsigns.nvim' } --git status
    use { 'romgrk/barbar.nvim' } --tabbing top bar
    use { 'RRethy/vim-illuminate' } --highlights other instance of word under cursor
    use { 'numToStr/Navigator.nvim' } --adds keybinds for moving to split windows
    use {'numToStr/Comment.nvim'}
    
    
end)