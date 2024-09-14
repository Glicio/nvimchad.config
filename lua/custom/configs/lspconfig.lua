local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

local servers = {"bashls", "html", "cssls", "ts_ls", "prismals", "tailwindcss", "emmet_ls", "gradle_ls", "gopls", "jdtls" }

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
end

lspconfig.clangd.setup {
  on_attach = function (client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

lspconfig.ts_ls.setup {
  on_attach = function (client, bufnr)
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  init_options = {
    preferences = {
      importModuleSpecifierPreference = "relative",
      -- includeCompletionsForModuleExports = false,
    },
  },
}

lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})
