vim.cmd("autocmd!")
local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true
vim.wo.number = true

-- encoding
vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

-- general settings
opt.shiftwidth = 2
opt.tabstop = 2
opt.cmdheight = 1
opt.laststatus = 2
opt.expandtab = true
opt.termguicolors = true
opt.expandtab = true
opt.title = true
opt.autoindent = true 
opt.wrap = false
opt.ignorecase = true 
opt.smartcase = true
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark" 
opt.signcolumn = "yes"
opt.backspace = { 'start', 'eol', 'indent' }
opt.path:append { '**' } -- Finding files - Search down into subfolders
opt.wildignore:append { '*/node_modules/*' }
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
opt.guifont = { "JetBrains Mono Medium Nerd Font Complete Mono", "h20" }           -- the font used in graphical neovim applications
vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format()' ]]
 -- github commit messages
 vim.g.blamer_enabled = 1
 vim.g.blamer_prefix = '  '