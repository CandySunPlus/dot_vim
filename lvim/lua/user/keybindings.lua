local M = {}

M.config = function ()
  -- keymappings [view all the defaults by pressing <leader>Lk]
  lvim.leader = "space"
  -- add your own keymapping
  lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

  -- unmap a default keymapping
  -- lvim.keys.normal_mode["<C-Up>"] = ""
  -- edit a default keymapping
  -- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

  -- Use which-key to add extra bindings with the leader-key prefix
  -- lvim.builtin.which_key.mappings["P"] = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Projects" }
  lvim.builtin.which_key.mappings["t"] = {
    name = "+Trouble",
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
    t = { "<cmd>TodoTrouble<cr>", "TodoTrouble"}
  }

  lvim.builtin.which_key.mappings["e"] = {}
  lvim.builtin.which_key.mappings["k"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" }
  lvim.builtin.which_key.mappings["l"]["s"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" }
  lvim.builtin.which_key.mappings["l"]["o"] = { "<cmd>SymbolsOutline<cr>", "Outline" }
  lvim.builtin.which_key.mappings["l"]["t"] = { "<cmd>TodoTelescope<cr>", "Todo" }
end

return M
