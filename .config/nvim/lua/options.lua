-- ~/.config/nvim/lua/options.lua
local opt = vim.opt

-- ファイル
-- opt.fenc = "utf-8"
opt.backup = false
opt.swapfile = false
opt.autoread = true
opt.hidden = true

-- 表示
opt.number = true
opt.cursorline = true
opt.cursorcolumn = true
opt.virtualedit = "onemore"
opt.smartindent = true
opt.visualbell = true
opt.showmatch = true
opt.laststatus = 2
opt.wildmode = "list:longest"
opt.showcmd = true

-- タブ
opt.list = true
opt.listchars = { tab = "▸-", eol = "$", trail = "_" }
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2

-- 検索
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.wrapscan = true
opt.hlsearch = true

-- その他
opt.viminfo = "'20,\"1000"
