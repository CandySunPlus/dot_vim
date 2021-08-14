local M = {}

M.config = function ()
  lvim.plugins = {
    { "folke/tokyonight.nvim" },
    { "folke/lsp-colors.nvim", event = "BufRead" },
    {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("user.colorizer").config()
      end,
      event = "BufRead"
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      setup = function()
        require("user.indent_blankline").setup()
      end
    },
    {
      "windwp/nvim-spectre",
      event = "BufRead",
      config = function()
        require("spectre").setup()
      end,
    },
    {
      "phaazon/hop.nvim",
      event = "BufRead",
      config = function()
        require("user.hop").config()
      end,
    },
    {
      "nvim-lua/lsp-status.nvim",
      disable = not lvim.builtin.galaxyline.active,
    },
    {
      "tpope/vim-surround",
      keys = {"c", "d", "y"}
    },
    {
      "simrat39/symbols-outline.nvim",
      cmd = "SymbolsOutline",
    },
    {
      "simrat39/rust-tools.nvim",
      config = function()
        require("user.rust_tools").config()
      end,
      ft = { "rust", "rs" },
    },
    {
      "sindrets/diffview.nvim",
      cmd = "DiffviewOpen",
    },
    {
      "ray-x/lsp_signature.nvim",
      config = function() require"lsp_signature".on_attach() end,
      event = "InsertEnter"
    },
    {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup()
      end,
      cmd = "Trouble",
    }
  }
end
return M
