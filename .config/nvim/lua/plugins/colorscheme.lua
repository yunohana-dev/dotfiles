return {
  "EdenEast/nightfox.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    vim.opt.termguicolors = true

    require("nightfox").setup({
      options = {
        compile_path = vim.fn.stdpath("cache") .. "/nightfox",
        terminal_colors = true,
        transparent = true,
        styles = {
          comments  = "italic",
          keywords  = "bold",
          functions = "NONE",
          strings   = "NONE",
          variables = "NONE",
          numbers   = "NONE",
          types     = "bold",
        },
        inverse = {
          match_paren = false,
          visual      = false,
          search      = false,
        },
        modules = {
          diagnostic = true,
          native_lsp = true,
          treesitter = true,
          gitsigns   = true,
          telescope  = true,
          cmp        = true,
        },
      },
    })

    vim.cmd.colorscheme("nightfox")
  end,
}
