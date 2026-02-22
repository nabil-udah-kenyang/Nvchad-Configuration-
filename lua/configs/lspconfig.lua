require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd", "intelephense", "pyright", "gopls", "ts_ls", "tsgo", "rust_analyzer" }
vim.lsp.enable(servers)

-- Enable inlay hints otomatis saat LSP attach
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
  end,
})

------- BAGIAN INLAY HINTS UNTUK MASING MASING BAHASA --------
-- c++
vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
    "--inlay-hints=true",
  },
})

-- PHP
vim.lsp.config("intelephense", {
  settings = {
    intelephense = {
      inlayHints = {
        parameterNames = {
          enabled = "all", -- tampilkan semua parameter
        },
        variableTypes = {
          enabled = true,
        },
        propertyDeclarationTypes = {
          enabled = true,
        },
        functionLikeReturnTypes = {
          enabled = true,
        },
      },
    },
  },
})

-- ts_ls(javascript family)
vim.lsp.config("ts_ls", {
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
})

-- rust

vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      inlayHints = {
        typeHints = true,
        parameterHints = true,
        chainingHints = true,
      },
    },
  },
})

-- Golang

vim.lsp.config("gopls", {
  settings = {
    gopls = {
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
})

-- -- 🔥 MATIKAN SEMANTIC TOKENS GLOBAL
-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     if client then
--       client.server_capabilities.semanticTokensProvider = nil
--     end
--   end,
-- })

-- read :h vim.lsp.config for changing options of lsp servers
