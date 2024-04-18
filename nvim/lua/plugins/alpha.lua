return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    require("astrocore").list_insert_unique(opts.section.buttons.val, {})
  end,
}
