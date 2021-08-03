let mapleader=' '

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap n nzz
nnoremap N Nzz
nnoremap J mzJ`z

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Main Plugins
nnoremap <silent> <leader>e <cmd>NvimTreeToggle<CR>
nnoremap <silent> <leader>ff <cmd>Telescope find_files hidden=true<CR>
nnoremap <silent> <C-t> <cmd>lua require'FTerm'.toggle()<CR>
tnoremap <silent> <C-t> <cmd>lua require'FTerm'.toggle()<CR>

" EasyAlign
xmap ga <Plug>(EasyAlign)
