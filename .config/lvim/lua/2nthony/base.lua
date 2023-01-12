-- vim
vim.cmd("autocmd!")

vim.wo.number = true

vim.opt.backup = false
vim.opt.mouse = ""
vim.opt.shell = 'fish'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.showcmd = true
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.wrap = false -- No Wrap lines
vim.opt.swapfile = false
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.undofile = true -- enable persistent undo, similar to undotree
vim.opt.inccommand = 'split'
vim.opt.laststatus = 2
vim.opt.breakindent = true
vim.opt.whichwrap = "" -- don't move cursor to prev/next line via any key
vim.opt.cmdheight = 2

-- define my own colorscheme field
-- because these themes powered by colorbuddy
vim.g.colorscheme = "neosolarized"
lvim.colorscheme = "vitesse"

-- lvim
lvim.format_on_save = true