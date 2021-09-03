-- Map leader to space
vim.g.mapleader = ' '

require('settings')
require('plugins')
require('keymappings')
require('compe-config')

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach,
  }
end

-- Configure lua language server for neovim development
local lua_settings = {
  Lua = {
    runtime = {
      version = 'LuaJIT',
      path = vim.split(package.path, ';'),
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = { 'vim' },
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
      }
    },
  }
}


local function setup_servers()
  require'lspinstall'.setup()

  local servers = require'lspinstall'.installed_servers()
  table.insert(servers, 'lua')
  table.insert(servers, 'python')
  table.insert(servers, 'rust')
  table.insert(servers, 'typescript')
  table.insert(servers, 'json')
  table.insert(servers, 'yaml')
  table.insert(servers, 'graphql')

  for _, server in pairs(servers) do
    local config = make_config()

    if server == 'lua' then
      config.settings = lua_settings
    end

    require'lspconfig'[server].setup(config)
  end
end

setup_servers()

require'lspinstall'.post_install_hook = function()
  setup_servers()
  vim.cmd('bufdo e')
end
