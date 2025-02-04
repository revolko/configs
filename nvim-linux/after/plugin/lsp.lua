local lsp = require("lsp-zero")

lsp.preset("recommended")
--lsp.ensure_installed({'pylsp'})

-- lsp.ensure_installed({
--   'tsserver',
--   'rust_analyzer',
-- })

-- Fix Undefined global 'vim'
--lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- Disable lintners of pylsp
-- Follow Ruff instructions: https://docs.astral.sh/ruff/integrations/#language-server-protocol-unofficial
-- require('lspconfig').pylsp.setup {
--     settings = {
--         pylsp = {
--             plugins = {
--                 ruff = {
--                     enabled = false
--                 },
--                 pycodestyle = {
--                     enabled = false
--                 },
--                 pydocstyle = {
--                     enabled = false
--                 },
--                 pyflakes = {
--                     enabled = false
--                 },
--                 pylint = {
--                     enabled = false
--                 },
--                 mccabe = {
--                     enabled = false
--                 },
--                 mypy = {
--                     enabled = false
--                 },
--                 pylsp_mypy = {
--                     enabled = false
--                 },
--             }
--         }
--     },
-- }
local on_attach = function(client, bufnr)
  if client.name == 'ruff_lsp' then
    -- Disable hover in favor of Pyright
    client.server_capabilities.hoverProvider = false
  end
end

require('lspconfig').ruff_lsp.setup {
  on_attach = on_attach,
}

-- should disable pyright hints that colide with ruff (NOT WORKING YET)
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 } 
require('lspconfig').pyright.setup {
  capabilities = capabilities,
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { '*' },
      },
    },
  },
}

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

vim.g.python3_host_prog = "/usr/bin/python3.12"
