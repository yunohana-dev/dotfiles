return {
  "github/copilot.vim",
  event = "InsertEnter",
  config = function()
    vim.g.copilot_no_tab_map = true

    vim.keymap.set("i", "<M-\\>", 'copilot#Accept("")', {
      expr = true,
      replace_keycodes = false,
      silent = true,
    })
    vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)",     { silent = true })
    vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)", { silent = true })
  end,
}
