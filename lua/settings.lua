vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.smartindent = true
vim.bo.tabstop = 2
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.number = true

vim.cmd 'au TextYankPost * lua vim.highlight.on_yank { on_visual = false}'
