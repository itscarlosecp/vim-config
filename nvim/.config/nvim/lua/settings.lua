-- GLOBALS
vim.cmd("syntax enable")   -- Enables syntax highlighting
vim.opt.hidden     = true  -- Dont unload buffer when its abandoned
vim.opt.wrap       = false -- Dont wrap long lines
vim.opt.ignorecase = true  -- Case insensitive search

-- AUTOCOMPLETION
vim.opt.completeopt = "menuone,noselect"
vim.opt.pumheight   = 10
vim.opt.cmdheight   = 2

-- INDENTATION
vim.opt.tabstop    = 2     -- Insert 2 spaces for a <TAB> press
vim.opt.shiftwidth = 2     -- Change the number of space characters inserted for indentation
vim.opt.expandtab  = false -- Converts spaces to tabs
vim.opt.autoindent = true  -- Good auto indent

-- EDITING
vim.opt.number         = true     -- Show line numbers
vim.opt.relativenumber = true     -- Show line relative numbers
vim.opt.scrolloff      = 5        -- Scroll before last visible line
vim.opt.cursorline     = true     -- highlight current line
vim.cmd("set iskeyword+=-")       -- Treat dash separated words as a word text object

-- INTERFACE
vim.opt.splitbelow    = true -- Horizontal splits will automatically be below
vim.opt.splitright    = true -- Vertical splits will automatically be to the right
vim.opt.termguicolors = true -- 256 color for terminal nvim

