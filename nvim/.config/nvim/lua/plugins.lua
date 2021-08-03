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
		requires = {
			'windwp/nvim-ts-autotag'
		},
		run = ':TSUpdate'
	}

	-- Autocompletion
	use {
		"hrsh7th/nvim-compe",
		config = function()
			require "_compe"
		end,
		event = "InsertEnter",
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
			'nvim-lua/plenary.nvim'
		},
	}

	-- Terminal
	use {
		"numtostr/FTerm.nvim",
    config = function()
			require'_fterm'
		end
	}

	-- Colorscheme
	use {
		'folke/tokyonight.nvim',
		config = function()
			vim.cmd[[colorscheme tokyonight]]
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

	-- Modules
	use {
		'kyazdani42/nvim-web-devicons',
		module = 'nvim-web-devicons',
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

