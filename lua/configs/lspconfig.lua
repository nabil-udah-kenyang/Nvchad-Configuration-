require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd", "intelephense", "pyright", "gopls", "ts_ls", "tsgo" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
