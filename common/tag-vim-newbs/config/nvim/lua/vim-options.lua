vim.cmd("set ignorecase")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard=unnamed")
vim.cmd("set splitright")
vim.cmd("set splitbelow")
vim.g.mapleader = " "

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')

vim.keymap.set('n', 'ss', ':wa<CR>')
vim.keymap.set('n', 'SS', ':xa<CR>')
vim.keymap.set('n', 'zz', ':x<CR>')
vim.keymap.set('n', 'ZZ', ':qa!<CR>')


vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

