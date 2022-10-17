-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "tokyonight-storm"
-- vim.o.tabstop = 4
-- vim.o.shiftwidth = 4
vim.o.exrc = true
vim.o.numberwidth = 2
vim.o.cmdheight = 1
vim.o.relativenumber = true
vim.o.wrap = true
vim.o.foldenable = false
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 5
vim.o.showbreak = " ↳  "




-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
require("user.builtin").config()

-- generic LSP settings
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" }, 1, 1)

-- Additional Plugins
require("user.plugins").config()

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
require("user.autocommands").config()

-- Additional keybindings
require("user.keybindings").config()

require("user.snips").config()
