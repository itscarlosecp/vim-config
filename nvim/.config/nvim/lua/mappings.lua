local map = vim.api.nvim_set_keymap
local noremap = {noremap = true}
local silent = {noremap = true, silent = true}

-- Leader
vim.g.mapleader = " "

-- File Explorer
map("n", "<Leader>e", ":NvimTreeToggle<CR>", noremap)

-- Telescope
map("n", "<Leader>ff", ":Telescope find_files hidden=true<CR>", silent)
map("n", "<Leader>fs", ":Telescope lsp_workspace_symbols<CR>",   silent)

-- Terminal
map("n", "<Leader>tt", ":vs | term<CR>", silent)
map("t", "<ESC>", "<C-\\><C-n>", silent)

-- Panes Movement
map("n", "<C-J>", "<C-W><C-J>", noremap)
map("n", "<C-K>", "<C-W><C-K>", noremap)
map("n", "<C-L>", "<C-W><C-L>", noremap)
map("n", "<C-H>", "<C-W><C-H>", noremap)

-- LspSaga
vim.cmd("inoremap <silent><expr> <C-.> compe#complete()")
vim.cmd("inoremap <silent><expr> <CR> compe#confirm('<CR>')")
vim.cmd("nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>")
vim.cmd("nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>")
vim.cmd("nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>")
vim.cmd("nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>")
vim.cmd("nnoremap <silent> K  <cmd>Lspsaga hover_doc<CR>")
vim.cmd("nnoremap <silent> ]g <cmd>Lspsaga diagnostic_jump_prev<CR>")
vim.cmd("nnoremap <silent> [g <cmd>Lspsaga diagnostic_jump_next<CR>")

-- The Primeagen Recommendations
map("n", "n", "nzz", noremap)
map("n", "N", "Nzz", noremap)
map("n", "J", "mzJ`z", noremap)

map("i", ",", ",<c-g>u", noremap)
map("i", ".", ".<c-g>u", noremap)
map("i", "!", "!<c-g>u", noremap)
map("i", "?", "?<c-g>u", noremap)
