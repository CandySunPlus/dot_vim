local M = {}

M.config = function()
  lvim.autocmds = {
    {
      "Filetype",
      {
        pattern = { "toml" },
        command = "lua require('cmp').setup.buffer { sources = {{ name = 'crates' }}}",
      },
    },
    {
      "Filetype",
      {
        pattern = { "vue" },
        command = "syntax sync fromstart",
      },
    },
    {
      "BufRead,BufNewFile",
      {
        pattern = { "*.wxml" },
        command = "setfiletype html",
      },
    },
    {
      "BufRead,BufNewFile",
      {
        pattern = { "*.wxss" },
        command = "setfiletype less",
      },
    },
    {
      "BufRead,BufNewFile",
      {
        pattern = { "*.wxs" },
        command = "setfiletype javascript",
      },
    },
    {
      "BufRead,BufNewFile",
      {
        pattern = { "*.mina" },
        command = "setfiletype vue",
      },
    },
    {
      "BufRead,BufNewFile",
      {
        pattern = { "*.m" },
        command = "setfiletype objc",
      },
    },
    {
      "BufRead,BufNewFile",
      {
        pattern = { "*.asm" },
        command = "setfiletype nasm",
      },
    },
    {
      "BufRead,BufNewFile",
      {
        pattern = { "CMakeLists.*" },
        command = "setfiletype cmake",
      },
    },
    {
      "BufRead,BufNewFile",
      {
        pattern = { "/etc/nginx/*", "/usr/local/nginx/conf/*", "/usr/local/etc/nginx/*" },
        command = "setfiletype nginx",
      },
    },
    {
      "BufRead,BufNewFile",
      {
        pattern = { "Cargo.toml" },
        command = "call crates#toggle()",
      },
    },
  }
end

return M
