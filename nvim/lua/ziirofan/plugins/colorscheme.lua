return {
  {
    "kepano/flexoki-neovim",
    name = "flexoki",
    -- config = function()
    --   vim.cmd.colorscheme("flexoki-dark")
    -- end,
  },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      compile = true,
      dimInactive = true,
      colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
    },
    build = ":KanagawaCompile",
    priority = 1000,
    config = function() end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        -- Recommended - see "Configuring" below for more config options
        transparent = true,
        italic_comments = true,
        hide_fillchars = true,
        borderless_telescope = true,
        terminal_colors = true,
      })
      vim.cmd("colorscheme cyberdream") -- set the colorscheme
    end,
  },
}
