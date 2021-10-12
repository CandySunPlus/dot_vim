-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "tokyonight"
-- vim.o.tabstop = 4
-- vim.o.shiftwidth = 4
vim.o.numberwidth = 2
vim.o.cmdheight = 1
vim.o.relativenumber = true
vim.o.wrap = true
vim.o.foldenable = false
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 5

-- for plugins
vim.g.tokyonight_style = "storm"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
require("user.builtin").config()

-- Additional Plugins
require("user.plugins").config()

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
require("user.autocommands").config()

-- Additional keybindings
require("user.keybindings").config()
