local M = {}

M.config = function ()
  lvim.autocommands.custom_groups = {
    { "Filetype", "vue", "syntax sync fromstart"},
    { "BufRead,BufNewFile", "*.wxml", "setfiletype html"},
    { "BufRead,BufNewFile", "*.wxss", "setfiletype less"},
    { "BufRead,BufNewFile", "*.wxs", "setfiletype javascript"},
    { "BufRead,BufNewFile", "*.mina", "setfiletype vue"},
    { "BufRead,BufNewFile", "*.m", "setfiletype objc"},
    { "BufRead,BufNewFile", "*.asm", "setfiletype nasm"},
    { "BufRead,BufNewFile", "Cargo.toml", "call crates#toggle()"},
    { "BufRead,BufNewFile", "/etc/nginx/*,/usr/local/nginx/conf/*,/usr/local/etc/nginx/*", "setfiletype nginx"},
  }
end

return M
