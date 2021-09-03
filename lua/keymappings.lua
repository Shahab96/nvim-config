local keymap = vim.api.nvim_set_keymap

local noremap = function(mode, lhs, rhs) keymap(mode, lhs, rhs, { noremap = true, silent = true }) end

-- Save on ctrl + s
noremap('n', '<C-s>', ':w<CR>')
noremap('i', '<C-s>', '<ESC>:w<CR>a')

-- Quit on ctrl + q
noremap('n', '<C-q>', ':q<CR>')
noremap('i', '<C-q>', '<ESC>:wq<CR>')

-- Better window movement
noremap('n', '<C-h>', '<C-w>h')
noremap('n', '<C-Left>', '<C-w>h')
noremap('n', '<C-j>', '<C-w>j')
noremap('n', '<C-Down>', '<C-w>j')
noremap('n', '<C-k>', '<C-w>k')
noremap('n', '<C-Up>', '<C-w>k')
noremap('n', '<C-l>', '<C-w>l')
noremap('n', '<C-Right>', '<C-w>l')

-- File explorer
noremap('n', '<Leader>e', ':NvimTreeToggle<CR>')

-- Better indenting
noremap('v', '<', '<gv')
noremap('v', '>', '>gv')

-- Change ESC key
noremap('i', 'jj', '<ESC>')

-- Better buffer navigation
noremap('n', '<TAB>', ':bnext<CR>')
noremap('n', '<S-TAB>', ':bprevious<CR>')

-- Telescope commands
noremap('n', '<Leader>ff', ':Telescope find_files<CR>')
noremap('n', '<Leader>fg', ':Telescope live_grep<CR>')
noremap('n', '<Leader>fb', ':Telescope buffers<CR>')
noremap('n', '<Leader>fh', ':Telescope help_tags<CR>')
