-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"



-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"
-- nvlsp.on_attach(function(client, bufnr)
--   local opts = {buffer = bufnr, remap = false}
--   vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
--   vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--   vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--   vim.keymap.set("n", "<leader>df", function() vim.diagnostic.open_float() end, opts)
--   vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
--   vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
--   vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
--   vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
--   vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
--   vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
-- end)

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.rust_analyzer.setup({
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = {"rust"},
  root_dir = lspconfig.util.root_pattern("Cargo.toml"),
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
})

local python_servers = {
  -- pyright = {
  --   pyright = {
  --     -- Using Ruff's import organizer
  --     disableOrganizeImports = true,
  --   },
  --   python = {
  --     analysis = {
  --       -- Ignore all files for analysis to exclusively use Ruff for linting
  --       ignore = { '*' },
  --     },
  --   },
  -- },
  jedi_language_server = {},
  ruff = {},
}

for name, settings in pairs(python_servers) do
  lspconfig[name].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    filetypes = {"python"},
    settings = settings,
  }
end

lspconfig["ts_ls"].setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- lspconfig.ruff.setup({
--   on_attach = nvlsp.on_attach,
--   capabilities = nvlsp.capabilities,
--   filetypes = {"python"},
-- })
--
-- lspconfig.pyright.setup({
--   on_attach = nvlsp.on_attach,
--   capabilities = nvlsp.capabilities,
--   filetypes = {"python"},
--   settings = {
--     pyright = {
--       -- Using Ruff's import organizer
--       disableOrganizeImports = true,
--     },
--     python = {
--       analysis = {
--         -- Ignore all files for analysis to exclusively use Ruff for linting
--         ignore = { '*' },
--       },
--     },
--   },
-- })

--for _, lsp in ipairs(python_servers) do
--  lspconfig[lsp].setup({
--    on_attach = nvlsp.on_attach,
--    capabilities = nvlsp.capabilities,
--    filetypes = {"python"},
--  })
--end
