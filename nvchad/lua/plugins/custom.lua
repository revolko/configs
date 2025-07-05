local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "ruff-lsp",
        "jedi-language-server",
        "elixir-ls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "configs.lspconfig"
    end
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "saecki/crates.nvim",
    ft = {"rust", "toml"},
    config = function (_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end
  },
  {
    "nvim-neotest/nvim-nio",
  },
  {
    "nvimtools/none-ls.nvim",
    filetypes = {"python", "elixir"},
    opts = function()
      return require "configs.none-ls"
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
  {
    "rest-nvim/rest.nvim",
    ft= {"http"},
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = function (_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, "http")
      end,
    }
  },
}

return plugins
