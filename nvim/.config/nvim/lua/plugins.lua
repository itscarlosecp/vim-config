return require "packer".startup(function(use)
	-- Packer can manage itself
  use "wbthomason/packer.nvim"

	-- Syntax Highlighting
	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require "_treesitter"
		end,
		event = "BufRead",
		run = ":TSUpdate"
	}
	-- Polyglot
	use {
    "sheerun/vim-polyglot",
    event = "BufRead",
    opt = true
  }

	-- File Explorer
	use {
		"kyazdani42/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		config = function()
			require "_nvimtree"
		end,
	}

	-- Telescope
	use {
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		config = function()
			require "_telescope"
		end,
		requires = {
			"nvim-lua/popup.nvim",
		}
	}

	-- Autocompletion / LSP
	use "neovim/nvim-lspconfig"
	use {
		"kabouzeid/nvim-lspinstall",
		config = function()
			require "_lsp"
		end,
	}
	use {
		"hrsh7th/nvim-compe",
		config = function()
			require "_compe"
		end,
		event = "InsertEnter",
		requires = {
			"windwp/nvim-autopairs",
		}
	}

	-- Interface
	use {
    "projekt0n/github-nvim-theme",
    config = function()
      require "github-theme".setup {
        themeStyle = "dark",
        commentStyle = "NONE",
        keywordStyle = "NONE",
        functionStyle = "NONE",
        variableStyle = "NONE"
      }
    end
  }
	use {
    "hoob3rt/lualine.nvim",
    config = function()
      require "_lualine"
    end,
    event = "BufWinEnter"
  }

	-- Modules / Dependencies
	use {
		"kyazdani42/nvim-web-devicons",
		module = "nvim-web-devicons"
	}
	use {
		"nvim-lua/plenary.nvim",
		module = "plenary"
	}

	-- Utilities
	use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require "colorizer".setup()
    end,
		ft = {"lua", "css", "html"},
  }
end)

