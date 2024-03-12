require("plugins")

vim.cmd("colorscheme gruvbox")

vim.g.mapleader = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

vim.bo.expandtab = true --use space character on pressing Tab key
vim.bo.softtabstop = 0 --Tab and BS: insert+delete number of spaces
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4 --Tab key: number of spaces for indendation
vim.wo.relativenumber = true

require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "gruvbox",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
})

require("nvim-treesitter.configs").setup({
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "html", "css", "bash", "php" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
})

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "clangd", "html", "cssls", "bashls" },
})

local nvim_lsp = require("lspconfig")

nvim_lsp.lua_ls.setup({})
nvim_lsp.clangd.setup({
    cmd = { "clangd", "--query-driver" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    single_file_support = true,
})
nvim_lsp.html.setup({})
nvim_lsp.cssls.setup({})
nvim_lsp.bashls.setup({})

require("conform").setup({
    formatters_by_ft = {
        c = { "clang_format" },
        python = { "black" },
        html = { "prettier" },
        css = { "prettier" },
        markdown = { "prettier" },
        bash = { "beautysh", "shellcheck", "shellharden" },
        lua = { "stylua" },
    },
    format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
        end
        return { timeout_ms = 500, lsp_fallback = true }
    end,
})

require("ibl").setup()
