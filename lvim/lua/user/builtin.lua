local M = {}

M.config = function ()
  lvim.builtin.dashboard.active = true
  lvim.builtin.terminal.active = true
  lvim.builtin.nvimtree.side = "left"
  lvim.builtin.nvimtree.show_icons.git = 0

  -- CMP
  -- =========================================
  lvim.builtin.cmp.documentation.border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
  lvim.builtin.cmp.experimental = {
    ghost_text = false,
    native_menu = false,
    custom_menu = true,
  }
  lvim.builtin.cmp.formatting.kind_icons = require("user.lsp_kind").symbols()
  lvim.builtin.cmp.formatting.source_names = {
    buffer = "(Buffer)",
    nvim_lsp = "(LSP)",
    luasnip = "(Snip)",
    treesitter = " ",
    nvim_lua = "(NvLua)",
    spell = " 暈",
    emoji = "  ",
    path = "  ",
    calc = "  ",
    cmp_tabnine = "  ",
  }

  -- NvimTree
  -- =========================================
  lvim.builtin.nvimtree.setup.auto_open = 0
  lvim.builtin.nvimtree.setup.diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  }

  -- Dashboard
  -- =========================================
  lvim.builtin.dashboard.active = true
  lvim.builtin.dashboard.custom_section["m"] = {
    description = { "  Marks              " },
    command = "Telescope marks",
  }

  -- LSP
  -- =========================================
  lvim.lsp.diagnostics.signs.values = {
    { name = "LspDiagnosticsSignError", text = " " },
    { name = "LspDiagnosticsSignWarning", text = "" },
    { name = "LspDiagnosticsSignHint", text = "" },
    { name = "LspDiagnosticsSignInformation", text = "" },
  }

  -- if you don't want all the parsers change this to a table of the ones you want
  lvim.builtin.treesitter.ensure_installed = "maintained"
  lvim.builtin.treesitter.ignore_install = { "haskell" }
  lvim.builtin.treesitter.highlight.enabled = true
  lvim.builtin.treesitter.indent.enable = true
  lvim.builtin.treesitter.context_commentstring.enable = true
  lvim.builtin.treesitter.matchup = true

  lvim.builtin.dap.active = false
  lvim.builtin.terminal.active = true
  lvim.builtin.nvimtree.auto_open = 0

  if lvim.builtin.dap.active then
    require("user.dap").config()
  end

  if lvim.builtin.lualine.active then
    lvim.builtin.lualine.on_config_done = function (lualine)
      require("user.lualine").config(lualine)
    end
  end
end

return M
