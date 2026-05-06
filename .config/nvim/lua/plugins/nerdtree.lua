return {
  "preservim/nerdtree",
  dependencies = {
    "Xuyuanp/nerdtree-git-plugin",
    "ryanoasis/vim-devicons",
  },
  config = function()
    vim.g.NERDTreeShowHidden = 1
    vim.g.NERDTreeHighlightCursorline = 1
    vim.g.NERDTreeGitStatusConcealBrackets = 1
    vim.g.NERDTreeNaturalSort = 1

    vim.keymap.set("n", "<C-e>", ":NERDTreeToggle<CR>", { silent = true })
  end,
}
