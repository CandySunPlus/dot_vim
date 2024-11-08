-- Customize Treesitter

---@type LazySpec
return { {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
        -- add more things to the ensure_installed table protecting against community packs modifying it
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
            "lua",
            "vim",
            "c",
            "cpp",
            "rust",
            "python",
            "toml",
            "yaml",
            "json",
            "typescript",
            "javascript",
            "bash",
            "cmake",
            "make",
            "comment",
            "dockerfile",
            "html",
            "css"
            -- add more arguments for adding more treesitter parsers
        })
    end,
}, {
    "kevinhwang91/nvim-ufo",
    version = "",
    commit = "522d719d421fc42b95577d9624048d8348d326ea",
    branch = "main",
} }
