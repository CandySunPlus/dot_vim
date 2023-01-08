local M = {}

M.config = function()
  lvim.plugins = {
    { "folke/lsp-colors.nvim", event = "BufRead" },
    {
      "xiyaowong/nvim-transparent",
      config = function()
        require("user.transparent").config()
      end
    },
    {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("user.colorizer").config()
      end,
      event = "BufRead"
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
      "nvim-pack/nvim-spectre",
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
      "kylechui/nvim-surround",
      tag = "*",
      config = function()
        require("nvim-surround").setup()
      end,
    },
    {
      "simrat39/symbols-outline.nvim",
      cmd = "SymbolsOutline",
      config = function()
        require("symbols-outline").setup()
      end,
    },
    {
      "sindrets/diffview.nvim",
      requires = 'nvim-lua/plenary.nvim',
      config = function()
        require("user/diffview").config()
      end
    },
    {
      "ray-x/lsp_signature.nvim",
      config = function()
        require("user/lsp_sign").config()
      end,
      event = "InsertEnter",
    },
    {
      "lvimuser/lsp-inlayhints.nvim",
      config = function()
        require("user/lsp_inlayhints").config()
      end,
    },
    {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup()
      end,
      cmd = "Trouble",
    },
    {
      "stevearc/dressing.nvim",
      config = function()
        require("user.dressing").config()
      end,
    },
    {
      "editorconfig/editorconfig-vim",
      event = "BufRead",
      config = function()
        require("user/editorconfig").config()
      end,
      cmd = { "EditorConfigEnable", "EditorConfigDisable", "EditorConfigReload" }
    },
    {
      'saecki/crates.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('crates').setup()
      end
    },
    {
      'akinsho/git-conflict.nvim',
      tag = "*",
      config = function()
        require('git-conflict').setup()
      end
    },
    {
      'tpope/vim-fugitive'
    }
  }
end
return M
