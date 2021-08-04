vim.lsp.protocol.CompletionItemKind = {
  '   (Text) ',
  '   (Method)',
  '   (Function)',
  '   (Constructor)',
  ' ﴲ  (Field)',
  '[] (Variable)',
  '   (Class)',
  ' ﰮ  (Interface)',
  '   (Module)',
  ' 襁 (Property)',
  '   (Unit)',
  '   (Value)',
  ' 練 (Enum)',
  '   (Keyword)',
  '   (Snippet)',
  '   (Color)',
  '   (File)',
  '   (Reference)',
  '   (Folder)',
  '   (EnumMember)',
  ' ﲀ  (Constant)',
  ' ﳤ  (Struct)',
  '   (Event)',
  '   (Operator)',
  '   (TypeParameter)'
}

vim.fn.sign_define(
  'LspDiagnosticsSignError',
  {texthl = 'LspDiagnosticsSignError', text = '', numhl = 'LspDiagnosticsSignError'}
)
vim.fn.sign_define(
  'LspDiagnosticsSignWarning',
  {texthl = 'LspDiagnosticsSignWarning', text = '', numhl = 'LspDiagnosticsSignWarning'}
)
vim.fn.sign_define(
  'LspDiagnosticsSignHint',
  {texthl = 'LspDiagnosticsSignHint', text = '', numhl = 'LspDiagnosticsSignHint'}
)
vim.fn.sign_define(
  'LspDiagnosticsSignInformation',
  {texthl = 'LspDiagnosticsSignInformation', text = '', numhl = 'LspDiagnosticsSignInformation'}
)

vim.lsp.handlers['textDocument/publishDiagnostics'] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = {
      prefix  = '',
      spacing = 0
    },
    signs     = true,
    underline = true
  }
)

local function common_on_attach()
	require'lsp_signature'.on_attach {
    bind = true,
		fix_pos = true, -- Don't autoclose
		hint_enable = false
  }

	-- vim.cmd[[nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>]]
	-- vim.cmd[[nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>]]
	-- vim.cmd[[nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>]]
	-- vim.cmd[[nnoremap <silent> gs <cmd>lua vim.lsp.buf.signature_help()<CR>]]
	-- vim.cmd[[nnoremap <silent> [g <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>]]
	-- vim.cmd[[nnoremap <silent> ]g <cmd>lua vim.lsp.diagnostic.next_next()<CR>]]
	vim.cmd[[nnoremap <silent> K <cmd>:Lspsaga hover_doc<CR>]]
	vim.cmd[[nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>]]
	vim.cmd[[nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>]]
	vim.cmd[[nnoremap <silent> gs <cmd>:Lspsaga signature_help<CR>]]
	vim.cmd[[nnoremap <silent> [g <cmd>:Lspsaga diagnostic_jump_prev<CR>]]
	vim.cmd[[nnoremap <silent> ]g <cmd>:Lspsaga diagnostic_jump_next<CR>]]
end

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    local client = require'lspconfig'[server]
    local config = require'_lsp.configs'[server] or client
    client.setup {
      filetypes = config.filetypes or client.filetypes,
      on_attach = common_on_attach,
      settings  = config.settings or {}
    }
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd('bufdo e') -- this triggers the FileType autocmd that starts the server
end
