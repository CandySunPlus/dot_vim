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
      "andymass/vim-matchup",
      event = "CursorMoved",
      config = function()
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
      end,
    },
    {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup()
      end,
      event = "BufRead",
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
      disable = not lvim.builtin.lualine.active,
    },
    {
      'ur4ltz/surround.nvim',
      config = function()
        require "surround".setup {mappings_style = "sandwich"}
      end,
    },
    {
      "simrat39/symbols-outline.nvim",
      cmd = "SymbolsOutline",
    },
    {
      "sindrets/diffview.nvim",
      cmd = "DiffviewOpen",
    },
    {
      "ray-x/lsp_signature.nvim",
      config = function()
        require("user/lsp_sign").config()
      end,
      event = "InsertEnter",
    },
    {
      "simrat39/rust-tools.nvim",
      config = function()
        require("user.rust_tools").config()
      end,
      ft = { "rust", "rs" },
    },
    {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup()
      end,
      cmd = "Trouble",
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    {
      "rcarriga/nvim-dap-ui",
      config = function()
        require("dapui").setup()
      end,
      ft = { "python", "rust", "go" },
      requires = { "mfussenegger/nvim-dap" },
      disable = not lvim.builtin.dap.active,
    },
    {
      "editorconfig/editorconfig-vim",
      event = "BufRead",
      config = function()
        require("user/editorconfig").config()
      end,
      cmd = {"EditorConfigEnable", "EditorConfigDisable", "EditorConfigReload"}
    },
    {
      "mhinz/vim-crates"
    }
  }
end
return M
