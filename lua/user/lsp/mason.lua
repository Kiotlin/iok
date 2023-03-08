local servers = {
  -- "sumneko_lua",
  -- "quick_lint_js",
  -- "texlab",
  "lua_ls",
  "tsserver",
  "html",
  "tailwindcss",
}

local settings = {
  ui = {
    border = "double",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local lspconfig = require("lspconfig")
local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  if server == "tsserver" then
    opts.filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact",
      "typescript.tsx" }
    opts.cmd = { "typescript-language-server", "--stdio" }
  end

  if server == "lua_ls" then
    opts.settings = {
      Lua = {
        diagnostics = {
          -- Get the language server to recognize the 'Vim' global
          globals = { 'vim' },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        }
      }
    }
  end

  lspconfig[server].setup(opts)
end
