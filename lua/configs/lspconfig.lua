require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd", "intelephense", "pyright", "gopls", "ts_ls", "tsgo" }
vim.lsp.enable(servers)

-- 🔥 MATIKAN SEMANTIC TOKENS GLOBAL
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})

-- read :h vim.lsp.config for changing options of lsp servers
