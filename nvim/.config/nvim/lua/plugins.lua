local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
	execute 'packadd packer.nvim'
end

return require'packer'.startup({function(use)
	-- LSP
	use 'neovim/nvim-lspconfig'
	use {
		'kabouzeid/nvim-lspinstall',
		config = function()
			require '_lsp'
		end
	}
	use {
		'glepnir/lspsaga.nvim',
		config = function()
			require '_lspsaga'
		end
	}

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require '_treesitter'
		end,
		event = 'BufRead',
		run = ':TSUpdate'
	}
	use {
		'windwp/nvim-ts-autotag',
		after = 'nvim-treesitter'
	}

	-- Autocompletion
	use {
		'hrsh7th/nvim-compe',
		config = function()
			require '_compe'
		end,
		event = 'InsertEnter',
		requires = {
			'windwp/nvim-autopairs',
			'ray-x/lsp_signature.nvim'
		}
	}

	-- Nvimtree
	use {
		'kyazdani42/nvim-tree.lua',
		cmd = 'NvimTreeToggle',
		config = function()
			require'_nvimtree'
		end,
		requires = {
			'kyazdani42/nvim-web-devicons'
		}
	}

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		cmd = 'Telescope',
		config = function()
			require'_telescope'
		end,
		requires = {
			'nvim-lua/popup.nvim',
			'nvim-lua/plenary.nvim',
			'kyazdani42/nvim-web-devicons'
		},
	}

	-- Terminal
	use {
		'numtostr/FTerm.nvim',
		config = function()
			require'_fterm'
		end
	}

	-- Colorscheme
	use {
		'projekt0n/github-nvim-theme',
		config = function()
			require 'github-theme'.setup {
				themeStyle = 'dark',
			}
		end
	}

	-- Statusline
	use {
		'hoob3rt/lualine.nvim',
		config = function()
			require'_lualine'
		end,
		event = 'BufWinEnter'
	}

	-- Gitsigns
	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require'gitsigns'
		end,
		event = 'BufReadPre',
	}

	-- Trouble
	use {
		'folke/trouble.nvim',
		cmd = 'Trouble',
		config = function()
			require'trouble'.setup()
		end
	}

	-- Formatter
	use {
		'mhartington/formatter.nvim',
		cmd = 'Format',
		config = function()
			require'_formatter'
		end
	}

	-- Utilities
	use {
		'tpope/vim-surround',
		cmd = 'S'
	}
	use {
		'junegunn/vim-easy-align',
		keys = '<Plug>(EasyAlign)'
	}
	use {
		'norcalli/nvim-colorizer.lua',
		config = function()
			require'colorizer'.setup()
		end,
		event = 'BufRead'
	}

	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
end,
	config = {
		display = {
			open_fn = function()
				return require'packer.util'.float{ border = 'single' }
			end
		}
	}})

