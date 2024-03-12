-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        -- or                            , branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    use({
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
    })

    use { "morhetz/gruvbox", as = "gruvbox" }

    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })

    use({
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup()
        end,
    })

    use("lukas-reineke/indent-blankline.nvim")

    use("neovim/nvim-lspconfig") -- enable LSP
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
end)
