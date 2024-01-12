local M = {}

M.config = function()
  lvim.use_icons = true

  -- NvimTree
  -- =========================================
  lvim.builtin.nvimtree.setup.view.side = "left"
  lvim.builtin.nvimtree.setup.sync_root_with_cwd = false
  -- lvim.builtin.nvimtree.
  -- lvim.builtin.nvimtree.show_icons.git = 0
  -- lvim.builtin.nvimtree.setup.open_on_setup = false

  lvim.builtin.breadcrumbs.active = true
  lvim.builtin.lir.active = true

  -- Telescope
  lvim.builtin.telescope.defaults.layout_config.width = 0.8
  -- lvim.builtin.telescope.defaults.path_display = { shorten = { len = 2, exclude = { 1, -1, -2 } } }
  lvim.builtin.telescope.pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
    }
  }

  -- Dashboard
  -- =========================================
  lvim.builtin.alpha.active = true
  -- table.insert(lvim.builtin.alpha.dashboard.section.buttons.entries, {
  --   "SPC m", "  Marks", "<CMD>Telescope marks<CR>",
  -- })
  --
  lvim.builtin.lir.active = false

  -- LSP
  -- =========================================
  local types = require('cmp.types')
  lvim.builtin.cmp.completion = {
    autocomplete = {
      types.cmp.TriggerEvent.TextChanged,
    },
    completeopt = 'menu,menuone,noselect',
    keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
    keyword_length = 1,
  }
  lvim.builtin.cmp.preselect = types.cmp.PreselectMode.None

  lvim.lsp.automatic_configuration.skipped_filetypes = { "markdown", "rst", "plaintext", "proto" }
  lvim.lsp.on_attach_callback = function(client, bufnr)
    require("lsp-inlayhints").on_attach(client, bufnr)
  end

  vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })
  local capabilities = require("lvim.lsp").common_capabilities()
  capabilities.offsetEncoding = { "utf-16" }
  local opts = {
    capabilities = capabilities,
    cmd = { "clangd", "--fallback-style=none" },
    root_dir = require("lspconfig.util").root_pattern(".nlsp-settings", "compile_commands.json", "compile_flags.txt",
      ".git"),
  }
  require("lvim.lsp.manager").setup("clangd", opts)

  -- if you don't want all the parsers change this to a table of the ones you want
  -- lvim.builtin.treesitter.ensure_installed = "maintained"
  lvim.builtin.treesitter.ensure_installed = { "c", "cpp", "rust", "python", "toml", "yaml", "cmake", "make",
    "dockerfile", "bash", "comment", "lua" }
  lvim.builtin.treesitter.ignore_install = { "haskell" }
  lvim.builtin.treesitter.highlight.enabled = true
  lvim.builtin.treesitter.indent.enable = true
  lvim.builtin.treesitter.context_commentstring.enable = false
  lvim.builtin.treesitter.matchup = true

  lvim.builtin.dap.active = true
  lvim.builtin.terminal.active = true

  lvim.builtin.lualine.options.theme = "catppuccin"

  -- if lvim.builtin.lualine.active then
  -- lvim.builtin.lualine.on_config_done = function(lualine)
  --   require("user.lualine").config(lualine)
  -- end
  -- end
end

return M
