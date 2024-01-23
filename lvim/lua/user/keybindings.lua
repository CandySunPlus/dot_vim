local M = {}

M.config = function()
  -- keymappings [view all the defaults by pressing <leader>Lk]
  lvim.leader = "space"
  -- add your own keymapping
  lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
  lvim.keys.term_mode["<C-l>"] = ""

  -- unmap a default keymapping
  -- lvim.keys.normal_mode["<C-Up>"] = ""
  -- edit a default keymapping
  -- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

  -- CMP
  -- =========================================
  local cmp_mapping = require "cmp.config.mapping"
  lvim.builtin.cmp.mapping["<C-l>"] = cmp_mapping.complete()

  -- Use which-key to add extra bindings with the leader-key prefix
  -- lvim.builtin.which_key.mappings["P"] = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Projects" }
  -- require('user.telescope_pickers').prettyGrepPicker({ picker = 'live_grep' })
  -- require('user.telescope_pickers').prettyGrepPicker({ picker = 'grep_string' })
  -- require('user.telescope_pickers').prettyFilesPicker({ picker = 'git_files' })
  -- require('user.telescope_pickers').prettyFilesPicker({ picker = 'oldfiles' })
  -- require("lvim.core.telescope.custom-finders").find_project_files { previewer = true }

  local function find_project_files()
    local tp = require('user.telescope_pickers')
    local ok = pcall(tp.prettyFilesPicker, { picker = 'git_files' })

    if not ok then
      tp.prettyFilesPicker({ picker = 'find_files' })
    end
  end

  lvim.builtin.which_key.mappings["f"] = {
    find_project_files,
    "Find File"
  }
  lvim.builtin.which_key.mappings["s"]["f"] = {
    find_project_files,
    "Find File"
  }
  lvim.builtin.which_key.mappings["s"]["g"] = {
    function()
      require('user.telescope_pickers').prettyGrepPicker({ picker = 'live_grep' })
    end,
    "Grep File"
  }

  lvim.builtin.which_key.mappings["T"] = {
    name = "+Trouble",
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    d = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostics" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    t = { "<cmd>TodoTrouble<cr>", "TodoTrouble" }
  }

  lvim.builtin.which_key.mappings["t"] = {
    name = "+Terminal",
    h = { "<cmd>ToggleTerm direction=horizontal size=10<cr>", "Toggle Horizontal Terminal" },
    v = { "<cmd>ToggleTerm direction=vertical size=60<cr>", "Toggle Vertical Terminal" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Toggle Float Terminal" },
    t = { "<cmd>ToggleTerm direction=tab<cr>", "Toggle Tab Terminal" },
  }

  lvim.builtin.which_key.mappings["D"] = {
    name = "+Diffview",
    d = { "<cmd>DiffviewOpen<cr>", "Open Diffview" },
    h = { "<cmd>DiffviewFileHistory<cr>", "Open File History" },
    c = { "<cmd>DiffviewClose<cr>", "Close Diffview" },
    u = { "<cmd>DiffviewRefresh<cr>", "Update Diffview" }
  }

  lvim.builtin.which_key.mappings["e"] = {}
  lvim.builtin.which_key.mappings["k"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" }
  lvim.builtin.which_key.mappings["l"]["h"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" }
  lvim.builtin.which_key.mappings["l"]["q"] = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostics" }
  lvim.builtin.which_key.mappings["l"]["o"] = { "<cmd>Outline<cr>", "Outline" }
  lvim.builtin.which_key.mappings["l"]["R"] = { "<cmd>Telescope lsp_references theme=dropdown<cr>", "Symbols References" }
  lvim.builtin.which_key.mappings["l"]["i"] = { "<cmd>Telescope lsp_implementations theme=dropdown<cr>",
    "Symbols Implementations" }
  lvim.builtin.which_key.mappings["d"]["B"] = { "<cmd>Telescope dap list_breakpoints<cr>", "Breakpoints" }
  lvim.builtin.which_key.mappings["d"]["l"] = { "<cmd>Telescope dap commands<cr>", "Breakpoints" }
  lvim.builtin.which_key.mappings["s"]["t"] = { "<cmd>TodoTelescope<cr>", "Todo" }
  lvim.builtin.which_key.mappings["s"]["g"] = { "<cmd>Telescope live_grep<cr>", "Grep Files" }
  lvim.builtin.which_key.mappings["l"]["R"] = { "<cmd>Telescope lsp_references theme=dropdown<cr>", "Symbols References" }

  lvim.builtin.which_key.mappings["g"]["g"] = { "<cmd>lua require 'user.terminal'.gitui_toggle()<cr>", "GitUI" }
  lvim.builtin.which_key.mappings["g"]["G"] = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" }

  lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<cmd>Telescope lsp_references theme=dropdown<cr>", "Goto References" }
  lvim.lsp.buffer_mappings.normal_mode["gI"] = { "<cmd>Telescope lsp_implementations theme=dropdown<cr>",
    "Goto Implementations" }
end

return M
