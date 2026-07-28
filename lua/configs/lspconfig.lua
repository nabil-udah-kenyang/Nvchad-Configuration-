require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "tailwindcss",
  "clangd",
  "intelephense",
  "pyright",
  "gopls",
  "ts_ls",
  -- "tsgo",
  "rust_analyzer",
  "jdtls",
  "vue_ls",
  -- "dartls",
}

-- Enable inlay hints otomatis saat LSP attach
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
  end,
})

------- BAGIAN INLAY HINTS UNTUK MASING MASING BAHASA --------
-- c++ (SUCCESS)

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

-- vue js
vim.lsp.config("vue_ls", {
  filetypes = { "vue" },
})

-- ts_ls(javascript family) (SUCCESS)

local vue_language_server_path = vim.fn.stdpath "data"
  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

vim.lsp.config("ts_ls", {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_language_server_path,
        languages = { "javascript", "typescript", "vue" },
      },
    },
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
  },
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

vim.lsp.enable(servers)

-- rust  (SUCCESS)

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

-- Golang  (SUCCESS)

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

-- tailwindcss

local util = require "lspconfig.util"

vim.lsp.config("tailwindcss", {
  filetypes = {
    "html",
    "vue",
    "blade",
    "php",
    "javascriptreact",
    "typescriptreact",
  },
})

-- Sembunyikan Hint & Info virtual text
vim.diagnostic.config {
  virtual_text = {
    severity = {
      min = vim.diagnostic.severity.WARN,
    },
  },

  signs = {
    severity = {
      min = vim.diagnostic.severity.WARN,
    },
  },

  underline = {
    severity = {
      min = vim.diagnostic.severity.WARN,
    },
  },
}

-- read :h vim.lsp.config for changing options of lsp servers
