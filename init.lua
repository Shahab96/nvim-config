-- Map leader to space
vim.g.mapleader = ' '

require('settings')
require('plugins')
require('keymappings')

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
  require'lspconfig'.lua.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
  }
end

setup_servers()

require'lspinstall'.post_install_hook = function()
  setup_servers()
  vim.cmd('bufdo e')
end
